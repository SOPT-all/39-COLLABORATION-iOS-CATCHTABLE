//
//  MainTabView.swift
//  Catchtable-iOS
//
//  Created by dayeon on 11/9/26.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: MainTab = .home
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                // TODO: View 연동 필요
                HomeView().tag(MainTab.home)
                Text("Saved").tag(MainTab.saved)
                Text("Nearby").tag(MainTab.nearby)
                Text("Dining").tag(MainTab.dining)
                Text("My").tag(MainTab.my)
            }
            .toolbar(.hidden, for: .tabBar)
            
            CatchTableTabBar(selectedTab: $selectedTab)
        }
        .toolbar(.hidden, for: .navigationBar)
        .navigationDestination(for: HomeRoute.self) { route in
            switch route {
            case .restaurantDetail(let id):
                RestaurantDetailView(restaurantID: id)
            }
        }
    }
}

#Preview {
    MainTabView()
}
