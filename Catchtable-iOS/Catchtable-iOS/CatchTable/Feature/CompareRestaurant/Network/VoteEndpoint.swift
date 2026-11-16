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
    case submitBallot(voteID: Int, request: SubmitBallotRequestDTO)
    case close(voteID: Int)

    var path: String {
        switch self {
        case .create: return "/api/v1/votes"
        case .fetchDetail(let voteID): return "/api/v1/votes/\(voteID)"
        case .submitBallot(let voteID, _): return "/api/v1/votes/\(voteID)/ballots/me"
        case .close(let voteID): return "/api/v1/votes/\(voteID)/close"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .create: return .post
        case .fetchDetail: return .get
        case .submitBallot: return .post
        case .close: return .patch
        }
    }

    var body: (any Encodable)? {
        switch self {
        case .create(let request): return request
        case .fetchDetail: return nil
        case .submitBallot(_, let request): return request
        case .close: return nil
        }
    }
}
