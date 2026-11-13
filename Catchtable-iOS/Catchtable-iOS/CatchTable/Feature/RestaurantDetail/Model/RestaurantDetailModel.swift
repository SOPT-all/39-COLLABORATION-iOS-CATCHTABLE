//
//  RestaurantDetailModel.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/10/26.
//

import SwiftUI

enum RestaurantImageSource {
    case asset(ImageResource)
    case remote(URL)
}

struct RestaurantPhoto: Identifiable {
    let id: Int
    let image: RestaurantImageSource
}

struct RestaurantLocation {
    let lines: [Line]
    let stationName: String
    let distanceMeters: Int

    var distanceText: String {
        "\(stationName)에서 \(distanceMeters)m"
    }
}

struct RestaurantAmenity: Identifiable {
    let title: String
    var hasHelp = false

    var id: String { title }
}

struct RestaurantMenu: Identifiable {
    let id: Int
    let name: String
    let price: Int
    let image: RestaurantImageSource
    var isPriceFrom = false

    var priceText: String {
        let text = "\(price.formatted(.number.locale(.korean)))원"
        return isPriceFrom ? "\(text)~" : text
    }
}

struct RestaurantAISummary {
    let title: String
    let points: [String]
}

struct RestaurantDetail {
    let name: String
    let introduction: String
    let area: String
    let category: String
    let rating: Double
    let reviewCount: Int
    let photos: [RestaurantPhoto]
    let location: RestaurantLocation
    let priceRange: String
    let businessHours: String
    let phoneNumber: String
    let amenities: [RestaurantAmenity]
    let menus: [RestaurantMenu]
    let aiSummary: RestaurantAISummary?
    var photoCount = 12_000
    var bookmarkCount = 67_000
    var viewerCount = 75
    var lastOrder = "새벽 05:00 라스트오더"
    var reserveTitle = "바로 입장 가능"
    var isReservable = false

    private static let tenThousand = 10_000

    var ratingText: String {
        String(format: "%.1f", rating)
    }

    var reviewCountText: String {
        "리뷰 \(reviewCount.formatted(.number.locale(.korean)))개"
    }

    var viewerCountText: String {
        "\(viewerCount)명이 보고 있어요!"
    }

    var bookmarkCountText: String {
        guard bookmarkCount >= Self.tenThousand else {
            return bookmarkCount.formatted(.number.locale(.korean))
        }

        let count = Double(bookmarkCount) / Double(Self.tenThousand)
        return "\(count.formatted(.number.locale(.korean).precision(.fractionLength(0...1))))만"
    }
}

private extension Locale {
    static let korean = Locale(identifier: "ko_KR")
}

enum RestaurantDetailMockData {
    static let detail = RestaurantDetail(
        name: "하이디라오 서초점",
        introduction: "중국 본토의 맛 그대로, 차원이 다른 No.1 훠궈",
        area: "강남",
        category: "중식",
        rating: 4.7,
        reviewCount: 6_139,
        photos: [
            RestaurantPhoto(id: 1, image: .asset(.imgPhoto1)),
            RestaurantPhoto(id: 2, image: .asset(.imgPhoto2))
        ],
        location: RestaurantLocation(
            lines: [.line9, .lineShinbundang],
            stationName: "신논현역",
            distanceMeters: 221
        ),
        priceRange: "3-5만원",
        businessHours: "영업 중",
        phoneNumber: "0507-1350-8260",
        amenities: [
            RestaurantAmenity(title: "최대 8명 예약", hasHelp: true),
            RestaurantAmenity(title: "주차"),
            RestaurantAmenity(title: "발렛"),
            RestaurantAmenity(title: "콜키지"),
            RestaurantAmenity(title: "장애인 편의시설"),
            RestaurantAmenity(title: "단체"),
            RestaurantAmenity(title: "무선 인터넷")
        ],
        menus: [
            RestaurantMenu(
                id: 1,
                name: "루로우판",
                price: 4_500,
                image: .asset(.imgMenu1)
            ),
            RestaurantMenu(
                id: 2,
                name: "탄탄면",
                price: 5_000,
                image: .asset(.imgMenu2)
            ),
            RestaurantMenu(
                id: 3,
                name: "돼지고기튀김",
                price: 5_900,
                image: .asset(.imgMenu3)
            )
        ],
        aiSummary: RestaurantAISummary(
            title: "중국 본토의 맛 그대로, 차원이 다른 훠궈 전문점",
            points: [
                "다양한 재료를 취향대로 골라 먹을 수 있는 중국 본토 스타일의 훠궈 전문점이에요.",
                "소스바에서 입맛에 맞게 소스를 만들어 즐길 수 있으며, 달콤한 케이크도 맛볼 수 있어요.",
                "자리에서 화려한 면 퍼포먼스를 감상할 수 있고, 생일이나 기념일에 방문하기 좋은 곳이에요."
            ]
        )
    )
}
