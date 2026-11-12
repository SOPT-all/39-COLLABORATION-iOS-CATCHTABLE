//
//  RestaurantDetailComponents.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/10/26.
//

import SwiftUI

struct RestaurantDetailDivider: View {
    var body: some View {
        Rectangle()
            .fill(Color.gray100)
            .frame(height: 8)
    }
}

struct RestaurantPhotoCarousel: View {
    let photos: [RestaurantPhoto]
    let viewerCountText: String

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(photos) { photo in
                    RestaurantImageView(source: photo.image)
                        .scaledToFill()
                        .frame(width: 294, height: 224)
                        .clipShape(.rect(cornerRadius: 16))
                        .overlay(alignment: .bottomLeading) {
                            if photo.id == photos.first?.id {
                                viewerBadge
                            }
                        }
                }
            }
            .padding(.horizontal, 20)
        }
    }

    private var viewerBadge: some View {
        HStack(spacing: 2) {
            Image(.iconFire)
                .resized(to: 20)

            Text(viewerCountText)
                .typography(.bodySb12)
                .foregroundStyle(.white)
        }
        .padding(.leading, 8)
        .padding(.trailing, 12)
        .frame(height: 32)
        .background(Color.black40, in: .capsule)
        .padding(.leading, 8)
        .padding(.bottom, 11)
    }
}

struct RestaurantSummaryView: View {
    let detail: RestaurantDetail

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 0) {
                Text(detail.name)
                    .font(.pretendard(.bold, size: 22))
                    .foregroundStyle(.gray900)
                    .lineLimit(1)

                Spacer(minLength: 8)

                PickTogetherButton { }
            }

            VStack(alignment: .leading, spacing: 0) {
                ratingRow

                Text(detail.introduction)
                    .typography(.bodyMd12)
                    .foregroundStyle(.gray500)
                    .frame(height: 18, alignment: .top)
            }
        }
    }

    private var ratingRow: some View {
        HStack(spacing: 6) {
            HStack(spacing: 4) {
                HStack(spacing: 2) {
                    Image(.iconStarLg)
                        .resized(to: 20)

                    Text(detail.ratingText)
                        .typography(.h3Sb14)

                    separator
                }

                HStack(spacing: 0) {
                    Text(detail.ratingCountText)
                        .typography(.h3Sb14)

                    Image(.iconStoreNext)
                        .resized(to: 12)
                }
            }

            categoryText(detail.area)
            categoryText(detail.category)
        }
        .foregroundStyle(.gray900)
        .frame(height: 24)
    }

    private var separator: some View {
        Image(.iconSeparator)
            .resized(to: 4)
    }

    private func categoryText(_ text: String) -> some View {
        HStack(spacing: 6) {
            separator

            Text(text)
                .typography(.bodyMd12)
        }
    }
}

struct RestaurantInfoRows: View {
    let detail: RestaurantDetail

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            locationRow
            priceRow
            businessHoursRow
            phoneRow
        }
        .padding(.bottom, 4)
        .foregroundStyle(.gray900)
    }

    private var locationRow: some View {
        HStack(spacing: 0) {
            HStack(spacing: 8) {
                rowIcon(.iconMap14)

                HStack(spacing: 4) {
                    ForEach(detail.location.lines, id: \.self) { line in
                        SubwayLineLabel(line: line)
                    }
                }

                infoText(detail.location.distanceText)
            }

            HStack(spacing: 4) {
                dropdownIcon

                HStack(spacing: 0) {
                    Image(.iconMap)
                        .resized(to: 20)

                    Text("위치")
                        .font(.pretendard(.medium, size: 13))
                        .foregroundStyle(.accentBlue)
                }
            }
        }
        .frame(height: 20)
    }

    private var priceRow: some View {
        HStack(spacing: 8) {
            rowIcon(.iconPrice14)
            infoText("1인당")

            HStack(spacing: 0) {
                infoText(detail.priceRange)

                Image(.iconHelpCompact)
                    .resized(to: 20)
            }
        }
        .frame(height: 20)
    }

    private var businessHoursRow: some View {
        HStack(spacing: 0) {
            HStack(spacing: 4) {
                HStack(spacing: 8) {
                    rowIcon(.iconTime14)
                    infoText(detail.businessStatus)
                }

                Circle()
                    .fill(Color.gray900)
                    .frame(width: 2, height: 2)

                infoText(detail.lastOrder)
            }

            dropdownIcon
        }
        .frame(height: 20)
    }

    private var phoneRow: some View {
        HStack(spacing: 8) {
            rowIcon(.iconPhone14)

            HStack(spacing: 6) {
                HStack(spacing: 2) {
                    infoText(detail.phoneNumber)

                    Image(.iconInfo)
                        .resized(to: 14)
                }

                Text("복사")
                    .typography(.captionMd10)
                    .foregroundStyle(.orangeBase)
            }
        }
        .frame(height: 16)
    }

    private var dropdownIcon: some View {
        Image(.iconDropdown)
            .resized(to: 20)
    }

    private func rowIcon(_ icon: ImageResource) -> some View {
        Image(icon)
            .resized(to: 14)
    }

    private func infoText(_ text: String) -> some View {
        Text(text)
            .typography(.bodyMd12)
            .lineLimit(1)
    }
}

struct RestaurantMenuSection: View {
    let menus: [RestaurantMenu]

    var body: some View {
        VStack(spacing: 14) {
            HStack(spacing: 0) {
                HStack(spacing: 4) {
                    Text("메뉴")
                        .typography(.h1Md16)
                        .foregroundStyle(.gray900)

                    Image(.iconStoreNext)
                        .resized(to: 12)
                }

                Spacer(minLength: 0)

                Text("메뉴판 이미지")
                    .typography(.h3Rg14)
                    .foregroundStyle(.orangeBase)
            }
            .padding(.horizontal, 20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 12) {
                    ForEach(menus) { menu in
                        RestaurantMenuCard(menu: menu)
                    }
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

struct RestaurantMenuCard: View {
    let menu: RestaurantMenu

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            RestaurantImageView(source: menu.image)
                .scaledToFill()
                .frame(width: 136, height: 136)
                .clipShape(.rect(cornerRadius: 8))

            VStack(alignment: .leading, spacing: 0) {
                Text(menu.name)
                    .typography(.h1B16)
                    .lineLimit(1)

                Text(menu.priceText)
                    .typography(.h3Sb14)
                    .lineLimit(1)
            }
            .foregroundStyle(.gray900)
        }
        .frame(width: 136, alignment: .leading)
    }
}

struct RestaurantAISummaryTitle: View {
    var body: some View {
        HStack(spacing: 4) {
            Image(.iconSparkleLg)
                .resized(to: 16)

            HStack(spacing: 2) {
                HStack(spacing: 0) {
                    Text("AI")
                        .foregroundStyle(LinearGradient.aiGradient)

                    Text("가 요약했어요")
                        .foregroundStyle(.gray900)
                }
                .typography(.displayB18)

                Image(.iconHelp)
                    .resized(to: 20)
            }
        }
    }
}

struct RestaurantAISummaryCard: View {
    let summary: RestaurantAISummary

    var body: some View {
        VStack(alignment: .trailing, spacing: 23) {
            VStack(alignment: .leading, spacing: 13) {
                Text(summary.title)
                    .typography(.bodySb12)
                    .foregroundStyle(.gray900)
                    .frame(height: 18)

                VStack(alignment: .leading, spacing: 6) {
                    ForEach(summary.points, id: \.self) { point in
                        pointRow(point)
                    }
                }
                .padding(.trailing, 5)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            HStack(spacing: 10) {
                feedbackIcon(.iconGood)
                feedbackIcon(.iconBad)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 18)
        .background(
            LinearGradient(
                colors: [.white, .aiCardBottom],
                startPoint: .top,
                endPoint: .bottom
            ),
            in: .rect(cornerRadius: 14)
        )
        .overlay {
            RoundedRectangle(cornerRadius: 14)
                .strokeBorder(LinearGradient.aiGradient, lineWidth: 1)
        }
        .shadow(color: .black.opacity(0.06), radius: 4)
    }

    private func pointRow(_ point: String) -> some View {
        HStack(spacing: 0) {
            Image(.iconBullet)
                .resized(to: 14)
                .frame(width: 24, height: 24)

            Text(point)
                .typography(.bodyMd12)
                .foregroundStyle(.gray500)
                .fixedSize(horizontal: false, vertical: true)
        }
    }

    private func feedbackIcon(_ icon: ImageResource) -> some View {
        Image(icon)
            .resized(to: 28)
    }
}

struct RestaurantDetailBottomBar: View {
    let bookmarkCountText: String
    let reserveTitle: String
    let isReservable: Bool

    var body: some View {
        HStack(spacing: 13) {
            HStack(spacing: 2) {
                barItem(.iconBookmark24, title: bookmarkCountText)
                barItem(.iconPhone, title: "전화")
            }

            ReserveButton(title: reserveTitle) { }
                .disabled(!isReservable)
        }
        .padding(.horizontal, 22)
        .padding(.top, 9)
        .padding(.bottom, 8)
        .background(Color.white)
        .overlay(alignment: .top) {
            Rectangle()
                .fill(Color.gray200)
                .frame(height: 1)
        }
    }

    private func barItem(_ icon: ImageResource, title: String) -> some View {
        VStack(spacing: 3) {
            Image(icon)
                .resized(to: 24)

            Text(title)
                .typography(.captionB10)
                .foregroundStyle(.gray900)
                .lineLimit(1)
        }
        .frame(width: 36)
    }
}

private extension Image {
    func resized(to size: CGFloat) -> some View {
        resizable()
            .frame(width: size, height: size)
    }
}

private extension LinearGradient {
    static let aiGradient = LinearGradient(
        colors: [.aiGradientStart, .aiGradientEnd],
        startPoint: .top,
        endPoint: .bottom
    )
}
