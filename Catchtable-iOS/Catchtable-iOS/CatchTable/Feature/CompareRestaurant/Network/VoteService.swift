//
//  VoteService.swift
//  Catchtable-iOS
//
//  Created by dayeon on 11/15/26.
//

protocol VoteServiceProtocol {
    func createVote(storeIDs: [Int]) async throws -> Int
    func fetchVoteDetail(voteID: Int) async throws -> VoteDetail
    func submitBallot(voteID: Int, candidateID: Int, nickname: String) async throws -> VoteDetail
    func closeVote(voteID: Int) async throws -> VoteDetail
}

final class VoteService {
    private let apiClient: APIClientProtocol

    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }
}

extension VoteService: VoteServiceProtocol {
    func createVote(storeIDs: [Int]) async throws -> Int {
        let response: CreateVoteResponseDTO = try await apiClient.request(
            VoteEndpoint.create(CreateVoteRequestDTO(storeIDs: storeIDs))
        )
        return response.voteID
    }
    
    func fetchVoteDetail(voteID: Int) async throws -> VoteDetail {
        let response: VoteDetailResponseDTO = try await apiClient.request(
            VoteEndpoint.fetchDetail(voteID: voteID)
        )
        return response.toModel()
    }
    
    func submitBallot(voteID: Int, candidateID: Int, nickname: String) async throws -> VoteDetail {
        let response: VoteDetailResponseDTO = try await apiClient.request(
            VoteEndpoint.submitBallot(
                voteID: voteID,
                request: SubmitBallotRequestDTO(candidateID: candidateID, nickname: nickname)
            )
        )
        return response.toModel()
    }
    
    func closeVote(voteID: Int) async throws -> VoteDetail {
        let response: VoteDetailResponseDTO = try await apiClient.request(
            VoteEndpoint.close(voteID: voteID)
        )
        return response.toModel()
    }
}
