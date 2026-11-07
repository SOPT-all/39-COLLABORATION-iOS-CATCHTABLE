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
        case .my: return "my"
        }
    }
    
    var selectedIcon: String {
        switch self {
        case .home: return "icon_nav_home_filled"
        case .saved: return "icon_nav_saved_filled"
        case .nearby: return "icon_nav_nearby"
        case .dining: return "icon_nav_dining_filled"
        case .my: return "icon_nav_account_filled"
        }
    }
    
    var unselectedIcon: String {
        switch self {
        case .home: return "icon_nav_home_outline"
        case .saved: return "icon_nav_saved_outline"
        case .nearby: return "icon_nav_nearby"
        case .dining: return "icon_nav_dining_outline"
        case .my: return "icon_nav_account_outline"
        }
    }
}

struct CatchTableTabBar: View {
    @State private var selectedTab: MainTab = .home
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                
                // TODO: View 연동 필요
                
                Text("Home").tag(MainTab.home)
                Text("Saved").tag(MainTab.saved)
                Text("Nearby").tag(MainTab.nearby)
                Text("Dining").tag(MainTab.dining)
                Text("My").tag(MainTab.my)
            }
            .toolbar(.hidden, for: .tabBar)
            
            HStack(spacing: 0) {
                ForEach(MainTab.allCases, id: \.self) { tab in
                    tabButton(
                        title: tab.title,
                        selectedIcon: tab.selectedIcon,
                        unselectedIcon: tab.unselectedIcon,
                        tab: tab
                    )
                }
            }
            .padding(.horizontal, 22)
            .padding(.top, 8)
            .padding(.bottom, 24)
            .background(.white)
        }
    }
    
    @ViewBuilder
    private func tabButton(title: String, selectedIcon: String, unselectedIcon: String, tab: MainTab) -> some View {
        Button {
            selectedTab = tab
        } label: {
            VStack(alignment: .center, spacing: 4) {
                Image(selectedTab == tab ? selectedIcon : unselectedIcon)
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 24, height: 24)
                
                Text(title)
                    .typography(.captionMd10)
            }
            .foregroundStyle(.gray900)
        }
        .frame(maxWidth: .infinity)
    }
}
