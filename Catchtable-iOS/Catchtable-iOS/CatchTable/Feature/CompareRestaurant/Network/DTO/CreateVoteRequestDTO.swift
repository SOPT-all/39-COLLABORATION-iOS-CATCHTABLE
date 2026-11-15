//
//  CreateVoteRequestDTO.swift
//  Catchtable-iOS
//
//  Created by dayeon on 11/15/26.
//

struct CreateVoteRequestDTO: Encodable {
    let storeIDs: [Int]

    enum CodingKeys: String, CodingKey {
        case storeIDs = "storeIds"
    }
}
