//
//  CompareRestaurantViewModel.swift
//  Catchtable-iOS
//
//  Created by dayeon on 11/12/26.
//

import Foundation
import Observation

@Observable
final class CompareRestaurantViewModel {
    private(set) var restaurants: [CompareRestaurant] = []
    private(set) var selectedStoreId: UUID?
    
    var isVoted: Bool { selectedStoreId != nil }
    var buttonTitle: String {
        isVoted ? "매장 선택 완료" : "가고 싶은 매장을 투표해주세요"
    }
    
    init() {
        restaurants = CompareRestaurantMockData.restaurants
    }
    
    func isSelected(_ restaurant: CompareRestaurant) -> Bool {
        selectedStoreId == restaurant.store.id
    }
    
    func select(_ restaurant: CompareRestaurant) {
        let id = restaurant.store.id
        selectedStoreId = (selectedStoreId == id) ? nil : id
    }
    
    func completeVote() {
        // TODO: API
    }
}
