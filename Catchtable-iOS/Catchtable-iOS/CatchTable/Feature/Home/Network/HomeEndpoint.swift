//
//  HomeEndpoint.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/15/26.
//

enum HomeEndpoint {
    case fetchMyActiveVote
}

extension HomeEndpoint: Endpoint {
    var path: String {
        switch self {
        case .fetchMyActiveVote:
            "/api/v1/users/me/votes/active"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .fetchMyActiveVote:
            .get
        }
    }
}
