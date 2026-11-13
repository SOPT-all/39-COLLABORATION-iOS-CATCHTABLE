//
//  APIErrorCode.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/13/26.
//

enum APIErrorCode: String {
    case invalidRequest = "INVALID_REQUEST"
    case unauthorized = "UNAUTHORIZED"
    case invalidNickname = "INVALID_NICKNAME"
    case invalidVoteCandidate = "INVALID_VOTE_CANDIDATE"
    case voteNotFound = "VOTE_NOT_FOUND"
    case alreadyVoted = "ALREADY_VOTED"
    case voteClosed = "VOTE_CLOSED"
    case voteCloseForbidden = "VOTE_CLOSE_FORBIDDEN"
    case voteAlreadyClosed = "VOTE_ALREADY_CLOSED"
    case unknown

    init(code: String) {
        self = APIErrorCode(rawValue: code) ?? .unknown
    }
}
