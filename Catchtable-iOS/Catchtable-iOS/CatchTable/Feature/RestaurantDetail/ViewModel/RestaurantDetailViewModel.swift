//
//  RestaurantDetailViewModel.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/10/26.
//

import Observation

@Observable
final class RestaurantDetailViewModel {
    enum State {
        case loading
        case loaded(RestaurantDetail)
        case failed
    }

    private(set) var state: State = .loading

    private let restaurantID: Int
    private let service: any RestaurantDetailServiceProtocol

    init(restaurantID: Int, service: any RestaurantDetailServiceProtocol) {
        self.restaurantID = restaurantID
        self.service = service
    }

    func load() async {
        state = .loading

        do {
            let detail = try await service.fetchRestaurantDetail(id: restaurantID)
            state = .loaded(detail)
        } catch {
            state = .failed
        }
    }
}
