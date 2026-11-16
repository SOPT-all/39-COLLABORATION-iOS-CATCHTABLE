//
//  MyActiveVoteResponseDTO.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/15/26.
//

struct MyActiveVoteResponseDTO: Decodable {
    let vote: Vote?
}

extension MyActiveVoteResponseDTO {
    struct Vote: Decodable {
        let voteID: Int
        let candidateCount: Int

        enum CodingKeys: String, CodingKey {
            case candidateCount
            case voteID = "voteId"
        }
    }
}

extension MyActiveVoteResponseDTO {
    func toModel() -> HomeActiveVote? {
        guard let vote else { return nil }
        return HomeActiveVote(id: vote.voteID, candidateCount: vote.candidateCount)
    }
}
