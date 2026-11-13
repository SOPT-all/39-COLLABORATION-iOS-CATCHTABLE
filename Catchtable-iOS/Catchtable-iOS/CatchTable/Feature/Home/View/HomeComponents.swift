//
//  HomeComponents.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/9/26.
//

import SwiftUI

struct HomeSectionTitle: View {
    let title: String

    var body: some View {
        Text(title)
            .typography(.displayB18)
            .foregroundStyle(.gray900)
    }
}

struct HomeMoreLabel: View {
    let title: String

    var body: some View {
        HStack(spacing: 4) {
            Text(title)
                .typography(.h3Md14)
                .foregroundStyle(.gray800)

            Image(.iconHomeNext)
                .resizable()
                .frame(width: 12, height: 12)
        }
    }
}

struct HomeCategoryItem: View {
    let category: HomeCategory

    var body: some View {
        VStack(spacing: 4) {
            Image(category.image)
                .resizable()
                .scaledToFill()
                .frame(width: 44, height: 44)
                .clipShape(.rect(cornerRadius: 16))

            Text(category.title)
                .typography(.captionMd10)
                .foregroundStyle(.gray900)
                .lineLimit(1)
                .frame(height: 17, alignment: .top)
        }
        .frame(width: 60, height: 65, alignment: .top)
    }
}

struct HomeAreaCard: View {
    let area: HomeArea

    var body: some View {
        VStack(spacing: 8) {
            Image(area.image)
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .clipShape(.rect(cornerRadius: 20))
                .overlay(alignment: .bottomLeading) {
                    if let badge = area.badge {
                        HomeAreaBadgeView(badge: badge)
                    }
                }

            Text(area.title)
                .typography(.bodyMd12)
                .foregroundStyle(.gray900)
                .lineLimit(1)
        }
        .frame(width: 64)
    }
}

struct HomeAreaBadgeView: View {
    let badge: HomeAreaBadge

    private let shape = UnevenRoundedRectangle(
        topLeadingRadius: 0,
        bottomLeadingRadius: 8,
        bottomTrailingRadius: 10,
        topTrailingRadius: 10
    )

    var body: some View {
        Text(badge.title)
            .typography(.captionB8)
            .foregroundStyle(.white)
            .frame(width: 27, height: 14)
            .background(badge.color, in: shape)
            .overlay {
                shape.strokeBorder(Color.white, lineWidth: 1)
            }
    }
}

struct HomeRecentStoreChip: View {
    let store: HomeRecentStore
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Image(store.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(.rect(cornerRadius: 8))

                VStack(alignment: .leading, spacing: 4) {
                    Text(store.name)
                        .typography(.h3Sb14)
                        .foregroundStyle(.gray900)
                        .lineLimit(1)

                    Text(store.infoText)
                        .typography(.bodyRg12)
                        .foregroundStyle(.gray500)
                        .lineLimit(1)
                }

                Spacer(minLength: 0)
            }
            .padding(.horizontal, 10)
            .frame(width: 222, height: 66)
            .background(Color.white, in: .rect(cornerRadius: 12))
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(isSelected ? Color.gray500 : Color.clear, lineWidth: 1)
            }
        }
        .buttonStyle(.plain)
    }
}

struct HomeSimilarStoreCard: View {
    let store: HomeSimilarStore

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(store.image)
                .resizable()
                .scaledToFill()
                .frame(width: 128, height: 128)
                .clipShape(.rect(cornerRadius: 6))

            VStack(alignment: .leading, spacing: 3) {
                Text(store.name)
                    .typography(.h3B14)
                    .foregroundStyle(.gray900)
                    .lineLimit(1)
                    .frame(height: 17)

                HStack(spacing: 2) {
                    Text(store.area)
                        .lineLimit(1)

                    Circle()
                        .fill(Color.gray500)
                        .frame(width: 2, height: 2)

                    Text(store.category)
                        .lineLimit(1)
                }
                .typography(.bodyB12)
                .foregroundStyle(.gray500)

                HStack(spacing: 4) {
                    Image(.iconStarMd)
                        .resizable()
                        .frame(width: 16, height: 16)

                    Text(store.rating)
                        .foregroundStyle(.gray900)

                    Text(store.reviewCount)
                        .foregroundStyle(.gray400)
                }
                .typography(.bodyB12)
            }
        }
        .frame(width: 128, alignment: .leading)
    }
}

struct HomeFavoriteStoreCard: View {
    let store: HomeFavoriteStore

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(store.image)
                .resizable()
                .scaledToFill()
                .frame(width: 160, height: 160)
                .clipShape(.rect(cornerRadius: 8))

            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(store.name)
                        .typography(.h3B14)
                        .foregroundStyle(.black)

                    HStack(spacing: 5) {
                        HStack(spacing: 2) {
                            Image(.iconStarLg)
                                .resizable()
                                .frame(width: 20, height: 20)

                            Text(store.rating)
                                .typography(.bodySb12)
                                .foregroundStyle(.black)
                        }

                        HStack(spacing: 2) {
                            Text(store.category)

                            Circle()
                                .fill(Color.gray500)
                                .frame(width: 2, height: 2)

                            Text(store.area)
                        }
                        .typography(.captionSb10)
                        .foregroundStyle(.gray500)
                        .lineLimit(1)
                    }
                }

                Spacer(minLength: 0)

                ZStack {
                    Circle()
                        .fill(Color.gray300)

                    Image(.iconBookmark20)
                        .renderingMode(.template)
                        .resizable()
                        .foregroundStyle(.white)
                        .frame(width: 20, height: 20)
                }
                .frame(width: 30, height: 30)
            }
        }
        .frame(width: 160, height: 210, alignment: .top)
    }
}
