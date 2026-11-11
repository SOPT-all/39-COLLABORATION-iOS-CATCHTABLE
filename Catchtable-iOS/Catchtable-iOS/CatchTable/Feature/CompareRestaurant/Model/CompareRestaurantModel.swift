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
}
