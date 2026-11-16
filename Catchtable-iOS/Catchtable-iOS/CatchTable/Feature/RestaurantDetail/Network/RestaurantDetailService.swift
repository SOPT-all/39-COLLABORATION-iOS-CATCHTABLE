//
//  RestaurantDetailService.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/10/26.
//

protocol RestaurantDetailServiceProtocol {
    func fetchRestaurantDetail(id: Int) async throws -> RestaurantDetail
}

final class RestaurantDetailService {
    private let apiClient: any APIClientProtocol

    init(apiClient: any APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }
}

extension RestaurantDetailService: RestaurantDetailServiceProtocol {
    func fetchRestaurantDetail(id: Int) async throws -> RestaurantDetail {
        let response: RestaurantDetailResponseDTO = try await apiClient.request(
            RestaurantDetailEndpoint.fetchRestaurantDetail(id: id)
        )
        return response.toModel()
    }
}

struct MockRestaurantDetailService: RestaurantDetailServiceProtocol {
    func fetchRestaurantDetail(id: Int) async throws -> RestaurantDetail {
        RestaurantDetailMockData.detail
    }
}
