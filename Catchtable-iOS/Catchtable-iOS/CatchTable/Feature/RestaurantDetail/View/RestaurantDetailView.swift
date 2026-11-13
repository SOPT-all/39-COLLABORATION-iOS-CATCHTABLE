//
//  RestaurantDetailView.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/10/26.
//

import SwiftUI

struct RestaurantDetailView: View {
    @State private var viewModel: RestaurantDetailViewModel
    @State private var selectedTab: RestaurantDetailTab = .home
    @State private var isBookmarked = false

    init(
        restaurantID: Int = 1,
        service: any RestaurantDetailServiceProtocol = MockRestaurantDetailService()
    ) {
        _viewModel = State(
            initialValue: RestaurantDetailViewModel(
                restaurantID: restaurantID,
                service: service
            )
        )
    }

    var body: some View {
        VStack(spacing: 0) {
            StoreHeader(
                onBack: { },
                onHome: { },
                isBookmarked: isBookmarked,
                onBookmark: { isBookmarked.toggle() }
            )

            content
        }
        .background(Color.white)
        .task {
            await viewModel.load()
        }
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        case .loaded(let detail):
            loadedContent(detail)
        case .failed:
            failedContent
        }
    }

    private var failedContent: some View {
        VStack(spacing: 12) {
            Text("가게 정보를 불러오지 못했어요")
                .typography(.h3Md14)
                .foregroundStyle(.gray500)

            Button("다시 시도") {
                Task { await viewModel.load() }
            }
            .typography(.h3Md14)
            .foregroundStyle(.orangeBase)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    private func loadedContent(_ detail: RestaurantDetail) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                infoSection(detail)
                    .padding(.top, 12)

                tabSection(detail)
                    .padding(.top, 12)

                aiSection(detail.aiSummary)
                    .padding(.top, 28)
                    .padding(.bottom, 74)
            }
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            RestaurantDetailBottomBar(
                bookmarkCountText: detail.bookmarkCountText,
                reserveTitle: detail.reserveTitle,
                isReservable: detail.isReservable
            )
        }
    }

    private func infoSection(_ detail: RestaurantDetail) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            RestaurantPhotoCarousel(
                photos: detail.photos,
                viewerCountText: detail.viewerCountText
            )

            RestaurantSummaryView(detail: detail)
                .padding(.horizontal, 20)

            Rectangle()
                .fill(Color.gray200)
                .frame(height: 1)
                .padding(.horizontal, 20)

            RestaurantInfoRows(detail: detail)
                .padding(.horizontal, 20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 6) {
                    ForEach(detail.amenities) { amenity in
                        StoreInfoLabel(infoText: amenity.title, isIcon: amenity.hasHelp)
                    }
                }
                .padding(.horizontal, 20)
            }
        }
    }

    private func tabSection(_ detail: RestaurantDetail) -> some View {
        VStack(spacing: 0) {
            RestaurantDetailDivider()

            RestaurantDetailTabBar(
                selectedTab: $selectedTab,
                photoCount: detail.photoCount,
                reviewCount: detail.reviewCount
            )
            .padding(.top, 10)

            RestaurantMenuSection(menus: detail.menus)
                .padding(.top, 20)
                .padding(.bottom, 22)

            RestaurantDetailDivider()
        }
    }

    private func aiSection(_ summary: RestaurantAISummary) -> some View {
        VStack(alignment: .leading, spacing: 24) {
            RestaurantAISummaryTitle()
            RestaurantAISummaryCard(summary: summary)
        }
        .padding(.horizontal, 20)
    }
}
