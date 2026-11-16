//
//  CreateVoteResponseDTO.swift
//  Catchtable-iOS
//
//  Created by dayeon on 11/14/26.
//

import Foundation

struct CreateVoteResponseDTO: Decodable {
    let voteID: Int
    let status: String
    let hostUserID: Int
    let candidates: [Candidate]
    let createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case status, candidates, createdAt
        case voteID = "voteId"
        case hostUserID = "hostUserId"
    }
}

extension CreateVoteResponseDTO {
    struct Candidate: Decodable {
        let candidateID: Int
        let storeID: Int
        let displayOrder: Int
        
        enum CodingKeys: String, CodingKey {
            case displayOrder
            case candidateID = "candidateId"
            case storeID = "storeId"
        }
    }
}
