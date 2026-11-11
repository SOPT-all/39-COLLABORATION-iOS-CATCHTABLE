//
//  CompareRestaurantModel.swift
//  Catchtable-iOS
//
//  Created by dayeon on 11/11/26.
//

import SwiftUI

struct VoteStore: Identifiable {
    let id = UUID()
    let image: ImageResource
    let name: String
    let rating: String
    let reviewCount: String
    let summary: String
    let priceRange: String
}

struct SubwayStation {
    let lines: [Line]
    let name: String
    let distance: Int
}

struct MainMenuInfo: Identifiable {
    let id = UUID()
    let image: ImageResource
    let name: String
    let price: Int
    var priceOver: Bool = false
}

struct CorkageInfo: Identifiable {
    let id = UUID()
    let type: String
    let price: String
}
