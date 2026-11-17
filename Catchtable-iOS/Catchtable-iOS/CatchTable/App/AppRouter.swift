//
//  AppRouter.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/18/26.
//

import SwiftUI

@Observable
final class AppRouter {
    var path = NavigationPath()

    func push(_ route: HomeRoute) {
        path.append(route)
    }

    func popToRoot() {
        path = NavigationPath()
    }
}
