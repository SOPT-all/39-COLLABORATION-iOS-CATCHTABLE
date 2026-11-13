//
//  CompareRestaurantModel.swift
//  Catchtable-iOS
//
//  Created by dayeon on 11/11/26.
//

import SwiftUI

struct CompareRestaurant: Identifiable {
    let id = UUID()
    let store: VoteStore
    let station: SubwayStation
    let menus: [MainMenuInfo]
    let corkages: [CorkageInfo]
}

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
    var isPriceOver: Bool = false
}

struct CorkageInfo: Identifiable {
    let id = UUID()
    let type: String
    let price: String
}

enum CompareRestaurantMockData {
    static let restaurants = [
        CompareRestaurant(
            store: VoteStore(
                image: .imgHaidilao148,
                name: "하이디라오 서초점",
                rating: "4.7",
                reviewCount: "6,139",
                summary: "중국 본토의 맛 그대로, 차원이 다른 훠궈 전문점",
                priceRange: "점심 저녁 동일가 3 - 5만원"
            ),
            station: SubwayStation(
                lines: [.line9, .lineShinbundang],
                name: "신논현역",
                distance: 221
            ),
            menus: [
                MainMenuInfo(
                    image: .imgHaidilaoMenu1,
                    name: "소기름훠궈",
                    price: 9000,
                    isPriceOver: true),
                MainMenuInfo(
                    image: .imgHaidilaoMenu2,
                    name: "청유마라훠궈",
                    price: 9000,
                    isPriceOver: true)
            ],
            corkages: [
                CorkageInfo(type: "와인", price: "5만원"),
                CorkageInfo(type: "위스키", price: "5만원"),
                CorkageInfo(type: "사케", price: "5만원")
            ]
        ),
        CompareRestaurant(
            store: VoteStore(
                image: .imgSoboki,
                name: "소보키 강남점",
                rating: "4.5",
                reviewCount: "644",
                summary: "트렌디한 퓨전 한식과 전통주가 어우러진 주점",
                priceRange: "1 - 4만원"
            ),
            station: SubwayStation(
                lines: [.line9, .lineShinbundang],
                name: "신논현역",
                distance: 396
            ),
            menus: [
                MainMenuInfo(
                    image: .imgSobokiMenu1,
                    name: "선비진 SET",
                    price: 69000
                ),
                MainMenuInfo(
                    image: .imgSobokiMenu2,
                    name: "문경바람 SET",
                    price: 49000
                )
            ],
            corkages: [
                CorkageInfo(type: "와인 외 가능", price: "5만원")
            ]
        ),
    ]
}
