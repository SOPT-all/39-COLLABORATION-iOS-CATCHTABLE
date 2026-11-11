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
}

struct SubwayStation {
    let lines: [Line]
    let name: String
    let distance: Int
}
