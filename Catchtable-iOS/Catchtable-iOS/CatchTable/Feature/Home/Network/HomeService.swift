//
//  HomeService.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/15/26.
//

protocol HomeServiceProtocol {
    func fetchMyActiveVote() async throws -> HomeActiveVote?
}

final class HomeService {
    private let apiClient: any APIClientProtocol

    init(apiClient: any APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }
}

extension HomeService: HomeServiceProtocol {
    func fetchMyActiveVote() async throws -> HomeActiveVote? {
        let response: MyActiveVoteResponseDTO = try await apiClient.request(
            HomeEndpoint.fetchMyActiveVote
        )
        return response.toModel()
    }
}
