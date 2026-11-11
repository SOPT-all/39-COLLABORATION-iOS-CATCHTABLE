//
//  CatchTableTabBar.swift
//  Catchtable-iOS
//
//  Created by dayeon on 11/8/26.
//

import SwiftUI

enum MainTab: Hashable, CaseIterable {
    case home
    case saved
    case nearby
    case dining
    case my

    var title: String {
        switch self {
        case .home: return "홈"
        case .saved: return "저장"
        case .nearby: return "내 주변"
        case .dining: return "마이다이닝"
        case .my: return "MY"
        }
    }

    var selectedIcon: ImageResource {
        switch self {
        case .home: return .iconNavHomeFilled
        case .saved: return .iconNavSavedFilled
        case .nearby: return .iconNavNearby
        case .dining: return .iconNavDiningFilled
        case .my: return .iconNavAccountFilled
        }
    }

    var unselectedIcon: ImageResource {
        switch self {
        case .home: return .iconNavHomeOutline
        case .saved: return .iconNavSavedOutline
        case .nearby: return .iconNavNearby
        case .dining: return .iconNavDiningOutline
        case .my: return .iconNavAccountOutline
        }
    }
}

struct CatchTableTabBar: View {
    @Binding var selectedTab: MainTab

    var body: some View {
        HStack(spacing: 0) {
            ForEach(MainTab.allCases, id: \.self) { tab in
                if tab != MainTab.allCases.first {
                    Spacer(minLength: 0)
                }

                tabButton(tab: tab)
            }
        }
        .padding(.horizontal, 22)
        .padding(.top, 8)
        .background(.white, ignoresSafeAreaEdges: .bottom)
        .overlay(alignment: .top) {
            Rectangle()
                .fill(Color.gray200)
                .frame(height: 1)
        }
    }

    private func tabButton(tab: MainTab) -> some View {
        let isSelected = selectedTab == tab

        return Button {
            selectedTab = tab
        } label: {
            VStack(alignment: .center, spacing: 4) {
                Image(isSelected ? tab.selectedIcon : tab.unselectedIcon)
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 24, height: 24)

                Text(tab.title)
                    .typography(isSelected ? .captionB10 : .captionMd10)
            }
            .foregroundStyle(.gray900)
            .frame(width: 44, height: 44)
            .contentShape(Rectangle())
        }
    }
}
