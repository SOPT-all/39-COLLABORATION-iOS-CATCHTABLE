//
//  RestaurantDetailEndpoint.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/14/26.
//

enum RestaurantDetailEndpoint {
    case fetchRestaurantDetail(id: Int)
}

extension RestaurantDetailEndpoint: Endpoint {
    var path: String {
        switch self {
        case .fetchRestaurantDetail(let id):
            "/api/v1/stores/\(id)"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .fetchRestaurantDetail:
            .get
        }
    }
}
