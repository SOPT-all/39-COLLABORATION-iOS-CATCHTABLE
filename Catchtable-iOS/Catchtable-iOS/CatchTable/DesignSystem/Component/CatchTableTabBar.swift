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
                    tabButton(tab: tab)
                }
            }
            .padding(.horizontal, 22)
            .padding(.top, 8)
            .background(.white, ignoresSafeAreaEdges: .bottom)
        }
    }
    
    @ViewBuilder
    private func tabButton(tab: MainTab) -> some View {
        Button {
            selectedTab = tab
        } label: {
            VStack(alignment: .center, spacing: 4) {
                Image(selectedTab == tab ? tab.selectedIcon : tab.unselectedIcon)
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 24, height: 24)
                
                Text(tab.title)
                    .typography(.captionMd10)
            }
            .foregroundStyle(.gray900)
            .frame(maxWidth: .infinity)
            .contentShape(Rectangle())
        }
    }
}

#Preview {
    CatchTableTabBar()
}
