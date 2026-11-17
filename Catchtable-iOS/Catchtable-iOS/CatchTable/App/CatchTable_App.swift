//
//  CatchTableApp.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/4/26.
//

import SwiftUI

@main
struct CatchTableApp: App {
    @State private var router = AppRouter()

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                MainTabView()
            }
            .environment(router)
        }
    }
}
