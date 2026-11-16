//
//  CompareRestaurantModel.swift
//  Catchtable-iOS
//
//  Created by dayeon on 11/11/26.
//

import SwiftUI

struct CompareRestaurant: Identifiable {
    var id: Int { store.id }
    let store: VoteStore
    let station: SubwayStation
    let menus: [MainMenuInfo]
    let corkages: [CorkageInfo]
    var candidateID: Int? = nil
    var voteCount: Int = 0
    var voterNames: [String] = []
}

struct VoteDetail {
    let id: Int
    let status: VoteStatus
    let participantCount: Int
    let restaurants: [CompareRestaurant]
    let viewer: VoteViewer
    
    var isOpen: Bool { status == .open }
    
    func voteRate(for restaurant: CompareRestaurant) -> Double {
        guard participantCount > 0 else { return 0 }
        return Double(restaurant.voteCount) / Double(participantCount)
    }
}

enum VoteStatus: String {
    case open = "OPEN"
    case closed = "CLOSED"
}

struct VoteViewer {
    let isHost: Bool
    let hasVoted: Bool
    let selectedCandidateID: Int?
    let defaultNickname: String
}

struct VoteStore: Identifiable {
    let id: Int
    let image: RestaurantImageSource?
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
    let id: Int
    let image: RestaurantImageSource?
    let name: String
    let price: Int
    var isPriceOver: Bool = false
}

struct CorkageInfo: Identifiable {
    let id: Int
    let content: String
}

enum CompareRestaurantMockData {
    static let restaurants = [
        CompareRestaurant(
            store: VoteStore(
                id: 1,
                image: .asset(.imgHaidilao148),
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
                    id: 1,
                    image: .asset(.imgHaidilaoMenu1),
                    name: "소기름훠궈",
                    price: 9000,
                    isPriceOver: true),
                MainMenuInfo(
                    id: 2,
                    image: .asset(.imgHaidilaoMenu2),
                    name: "청유마라훠궈",
                    price: 9000,
                    isPriceOver: true)
            ],
            corkages: [
                CorkageInfo(id: 0, content: "와인 5만원"),
                CorkageInfo(id: 1, content: "위스키 5만원"),
                CorkageInfo(id: 2, content: "사케 5만원")
            ]
        ),
        CompareRestaurant(
            store: VoteStore(
                id: 2,
                image: .asset(.imgSoboki),
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
                    id: 3,
                    image: .asset(.imgSobokiMenu1),
                    name: "선비진 SET",
                    price: 69000
                ),
                MainMenuInfo(
                    id: 4,
                    image: .asset(.imgSobokiMenu2),
                    name: "문경바람 SET",
                    price: 49000
                )
            ],
            corkages: [
                CorkageInfo(id: 0, content: "와인 외 가능 5만원")
            ]
        ),
    ]
}
