//
//  CatchTableTopTabBar.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/9/26.
//

import SwiftUI

enum TopTab: Hashable, CaseIterable {
    case ranking
    case situation
    case exclusive

    var title: String {
        switch self {
        case .ranking: return "랭킹"
        case .situation: return "상황별 추천"
        case .exclusive: return "캐치단독"
        }
    }
}

struct CatchTableTopTabBar: View {
    @Binding var selectedTab: TopTab

    var body: some View {
        HStack(spacing: 0) {
            ForEach(TopTab.allCases, id: \.self) { tab in
                if tab != TopTab.allCases.first {
                    Spacer(minLength: 0)
                }

                tabButton(tab)
            }
        }
        .padding(.horizontal, 27)
        .background(alignment: .bottom) {
            Rectangle()
                .fill(Color.gray100)
                .frame(height: 1)
        }
    }

    private func tabButton(_ tab: TopTab) -> some View {
        let isSelected = selectedTab == tab

        return Button {
            selectedTab = tab
        } label: {
            VStack(spacing: 6) {
                Text(tab.title)
                    .typography(.h3Md14)
                    .foregroundStyle(isSelected ? Color.gray900 : Color.gray500)

                Rectangle()
                    .fill(isSelected ? Color.gray600 : Color.clear)
                    .frame(width: 93, height: 1)
            }
            .contentShape(.rect)
        }
        .buttonStyle(.plain)
    }
}
