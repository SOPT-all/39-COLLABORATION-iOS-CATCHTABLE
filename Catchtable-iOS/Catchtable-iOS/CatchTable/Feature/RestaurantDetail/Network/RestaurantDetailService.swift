//
//  RestaurantDetailService.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/10/26.
//

protocol RestaurantDetailServiceProtocol {
    func fetchRestaurantDetail(id: Int) async throws -> RestaurantDetail
}

struct MockRestaurantDetailService: RestaurantDetailServiceProtocol {
    func fetchRestaurantDetail(id: Int) async throws -> RestaurantDetail {
        RestaurantDetailMockData.detail
    }
}
