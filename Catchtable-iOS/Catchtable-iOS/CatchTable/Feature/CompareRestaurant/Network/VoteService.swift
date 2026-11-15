//
//  VoteService.swift
//  Catchtable-iOS
//
//  Created by dayeon on 11/15/26.
//

protocol VoteServiceProtocol {
    func createVote(storeIDs: [Int]) async throws -> Int
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
}
