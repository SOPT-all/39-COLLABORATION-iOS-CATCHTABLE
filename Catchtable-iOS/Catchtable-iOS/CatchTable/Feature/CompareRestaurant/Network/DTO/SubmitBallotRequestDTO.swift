//
//  SubmitBallotRequestDTO.swift
//  Catchtable-iOS
//
//  Created by dayeon on 11/16/26.
//

struct SubmitBallotRequestDTO: Encodable {
    let candidateID: Int
    let nickname: String

    enum CodingKeys: String, CodingKey {
        case nickname
        case candidateID = "candidateId"
    }
}
