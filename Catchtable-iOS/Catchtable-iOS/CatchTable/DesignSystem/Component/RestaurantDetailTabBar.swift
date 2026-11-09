//
//  RestaurantDetailTabBar.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/9/26.
//

import SwiftUI

enum RestaurantDetailTab: Hashable, CaseIterable {
    case home
    case news
    case menu
    case photo
    case review
    case broadcast

    var title: String {
        switch self {
        case .home: return "홈"
        case .news: return "소식"
        case .menu: return "메뉴"
        case .photo: return "사진"
        case .review: return "리뷰"
        case .broadcast: return "방송"
        }
    }
}

struct RestaurantDetailTabBar: View {
    @Binding var selectedTab: RestaurantDetailTab
    let photoCount: Int
    let reviewCount: Int

    var body: some View {
        HStack(spacing: 0) {
            ForEach(RestaurantDetailTab.allCases, id: \.self) { tab in
                if tab != RestaurantDetailTab.allCases.first {
                    Spacer(minLength: 0)
                }

                tabButton(tab)
            }
        }
        .padding(.horizontal, 21)
        .background(alignment: .bottom) {
            Rectangle()
                .fill(Color.gray100)
                .frame(height: 1)
        }
    }

    private func tabButton(_ tab: RestaurantDetailTab) -> some View {
        let isSelected = selectedTab == tab

        return Button {
            selectedTab = tab
        } label: {
            HStack(spacing: 2) {
                Text(tab.title)
                    .typography(isSelected ? .h1Sb16 : .h1Rg16)

                if let count = countText(for: tab) {
                    Text(count)
                        .typography(.h3Md14)
                }
            }
            .foregroundStyle(isSelected ? Color.black : Color.gray500)
            .padding(.bottom, 10)
            .overlay(alignment: .bottom) {
                if isSelected {
                    Rectangle()
                        .fill(Color.black)
                        .frame(height: 2)
                }
            }
            .contentShape(.rect)
        }
        .buttonStyle(.plain)
    }

    private func countText(for tab: RestaurantDetailTab) -> String? {
        switch tab {
        case .photo: return formatted(photoCount)
        case .review: return formatted(reviewCount)
        default: return nil
        }
    }

    private func formatted(_ count: Int) -> String {
        guard count <= 9_999 else { return "9,999+" }
        return count.formatted(.number.locale(Locale(identifier: "ko_KR")))
    }
}
