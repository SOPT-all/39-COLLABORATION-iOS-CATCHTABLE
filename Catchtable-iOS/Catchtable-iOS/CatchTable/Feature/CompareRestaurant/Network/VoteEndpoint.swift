//
//  VoteEndpoint.swift
//  Catchtable-iOS
//
//  Created by dayeon on 11/15/26.
//

import Foundation

enum VoteEndpoint: Endpoint {
    case create(CreateVoteRequestDTO)
    case fetchDetail(voteID: Int)

    var path: String {
        switch self {
        case .create: return "/api/v1/votes"
        case .fetchDetail(let voteID): return "/api/v1/votes/\(voteID)"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .create: return .post
        case .fetchDetail: return .get
        }
    }

    var body: (any Encodable)? {
        switch self {
        case .create(let request): return request
        case .fetchDetail: return nil
        }
    }
}
