//
//  HomeView.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/9/26.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel: HomeViewModel
    @State private var selectedTab: TopTab = .ranking
    @State private var selectedRecentStoreID: HomeRecentStore.ID?

    init(voteRestaurantCount: Int? = nil) {
        _viewModel = State(
            initialValue: HomeViewModel(voteRestaurantCount: voteRestaurantCount)
        )
    }

    private var currentRecentStoreID: HomeRecentStore.ID? {
        selectedRecentStoreID ?? viewModel.recentStores.first?.id
    }

    var body: some View {
        VStack(spacing: 0) {
            HomeHeader()
                .padding(.horizontal, 20)

            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    topSheet
                    contentSheet
                }
                .background(Color.gray200)
            }
        }
        .background(Color.white)
        .overlay(alignment: .bottom) {
            if let voteRestaurantCount = viewModel.voteRestaurantCount {
                VoteFloatingBar(restaurantCount: voteRestaurantCount) { }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 81)
            }
        }
    }

    private var topSheet: some View {
        VStack(spacing: 0) {
            banner
                .padding(.top, 18)
                .padding(.horizontal, 20)

            CatchTableTopTabBar(selectedTab: $selectedTab)
                .padding(.top, 16)

            HStack(alignment: .top, spacing: 8) {
                ForEach(selectedTab.categories) { category in
                    HomeCategoryItem(category: category)
                }
            }
            .padding(.top, 23)
            .padding(.bottom, 24)
        }
        .frame(maxWidth: .infinity)
        .background(
            Color.white,
            in: UnevenRoundedRectangle(bottomLeadingRadius: 20, bottomTrailingRadius: 20)
        )
    }

    private var banner: some View {
        Image(.imgMainbanner)
            .resizable()
            .scaledToFill()
            .frame(maxWidth: .infinity)
            .frame(height: 140)
            .clipShape(.rect(cornerRadius: 8))
            .overlay(alignment: .bottomTrailing) {
                PhotoPageButton(currentPage: 14, totalPage: 23) { }
                    .padding(.trailing, 18)
                    .padding(.bottom, 12)
            }
    }

    private var contentSheet: some View {
        VStack(alignment: .leading, spacing: 20) {
            areaSection
            similarSection
            favoriteSection
        }
        .padding(.top, 38)
        .padding(.bottom, 28)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            Color.white,
            in: UnevenRoundedRectangle(topLeadingRadius: 20, topTrailingRadius: 20)
        )
    }

    private var areaSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                HStack(spacing: 6) {
                    HomeSectionTitle(title: "어디로 가시나요?")

                    Image(.iconDestination)
                        .resizable()
                        .frame(width: 26, height: 26)
                }

                Spacer(minLength: 0)

                HomeMoreLabel(title: "전체보기")
            }
            .frame(height: 28)

            HStack(spacing: 0) {
                ForEach(viewModel.areas) { area in
                    if area.id != viewModel.areas.first?.id {
                        Spacer(minLength: 0)
                    }

                    HomeAreaCard(area: area)
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 16)
    }

    private var similarSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    HomeSectionTitle(title: "최근 본 매장과 비슷한 곳")

                    Spacer(minLength: 0)

                    HomeMoreLabel(title: "최근 본 매장")
                }
                .frame(height: 28)
                .padding(.horizontal, 20)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(viewModel.recentStores) { store in
                            HomeRecentStoreChip(
                                store: store,
                                isSelected: currentRecentStoreID == store.id
                            ) {
                                selectedRecentStoreID = store.id
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 8) {
                    ForEach(viewModel.similarStores) { store in
                        HomeSimilarStoreCard(store: store)
                    }
                }
                .padding(.horizontal, 20)
            }
        }
        .padding(.bottom, 28)
    }

    private var favoriteSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 2) {
                    HomeSectionTitle(title: "\(viewModel.userName)님이 좋아할 맛집")

                    Text("마음에 들 만한 곳으로 모았어요")
                        .typography(.h3Rg14)
                        .foregroundStyle(.gray500)
                }

                Spacer(minLength: 0)

                HomeMoreLabel(title: "전체보기")
            }

            HStack(spacing: 0) {
                ForEach(viewModel.favoriteStores) { store in
                    if store.id != viewModel.favoriteStores.first?.id {
                        Spacer(minLength: 0)
                    }

                    HomeFavoriteStoreCard(store: store)
                }
            }
        }
        .padding(.horizontal, 20)
    }
}
