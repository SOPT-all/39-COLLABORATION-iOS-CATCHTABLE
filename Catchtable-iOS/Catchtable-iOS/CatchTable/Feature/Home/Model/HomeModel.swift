//
//  HomeModel.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/9/26.
//

import SwiftUI

struct HomeCategory: Identifiable {
    let title: String
    let image: ImageResource

    var id: String { title }
}

extension TopTab {
    var categories: [HomeCategory] {
        switch self {
        case .ranking:
            return [
                HomeCategory(title: "줄서기예약", image: .imgCategoryQueue),
                HomeCategory(title: "2026미쉐린", image: .imgCategoryMichelin),
                HomeCategory(title: "블루리본", image: .imgCategoryBlueRibbon),
                HomeCategory(title: "웨이팅top", image: .imgCategoryWaitingTop),
                HomeCategory(title: "예약핫플", image: .imgCategoryReserveHot)
            ]
        case .situation:
            return [
                HomeCategory(title: "데이트맛집", image: .imgCategoryDate),
                HomeCategory(title: "신상오픈맛집", image: .imgCategoryNewOpen),
                HomeCategory(title: "혼밥맛집", image: .imgCategorySolo),
                HomeCategory(title: "야장지도", image: .imgCategoryOutdoorMap),
                HomeCategory(title: "웨이팅맛집", image: .imgCategoryWaiting)
            ]
        case .exclusive:
            return [
                HomeCategory(title: "오늘 예약", image: .imgCategoryToday),
                HomeCategory(title: "케이크픽업", image: .imgCategoryCake),
                HomeCategory(title: "꽃주문", image: .imgCategoryFlower),
                HomeCategory(title: "선착순 1만원", image: .imgCategoryFirstCome),
                HomeCategory(title: "브랜드혜택존", image: .imgCategoryBrandBenefit)
            ]
        }
    }
}

enum HomeAreaBadge {
    case popular
    case hot

    var title: String {
        switch self {
        case .popular: return "인기"
        case .hot: return "핫플"
        }
    }

    var color: Color {
        switch self {
        case .popular: return .accentBlue
        case .hot: return .accentRed
        }
    }
}

struct HomeArea: Identifiable {
    let title: String
    let image: ImageResource
    var badge: HomeAreaBadge?

    var id: String { title }
}

struct HomeRecentStore: Identifiable {
    let name: String
    let area: String
    let category: String
    let image: ImageResource

    var id: String { name }
    var infoText: String { "\(area) · \(category)" }
}

struct HomeSimilarStore: Identifiable {
    let name: String
    let area: String
    let category: String
    let rating: String
    let reviewCount: String
    let image: ImageResource

    var id: String { name }
}

struct HomeFavoriteStore: Identifiable {
    let id: Int
    let name: String
    let rating: String
    let category: String
    let area: String
    let image: ImageResource
}

enum HomeMockData {
    static let userName = "윤린우"

    static let areas = [
        HomeArea(title: "청담", image: .imgAreaCheongdam, badge: .popular),
        HomeArea(title: "부산", image: .imgAreaBusan),
        HomeArea(title: "강남·역삼", image: .imgAreaGangnamYeoksam, badge: .popular),
        HomeArea(title: "용산·삼각지", image: .imgAreaYongsan, badge: .hot)
    ]

    static let recentStores = [
        HomeRecentStore(
            name: "하이디라오 서초점",
            area: "강남",
            category: "중식",
            image: .imgHaidilao48
        ),
        HomeRecentStore(
            name: "와아",
            area: "성수",
            category: "와인",
            image: .imgWaa
        )
    ]

    static let similarStores = [
        HomeSimilarStore(
            name: "하이디라오 서초점",
            area: "강남",
            category: "중식",
            rating: "4.7",
            reviewCount: "(6,139)",
            image: .imgSimilar01
        ),
        HomeSimilarStore(
            name: "하이디라오 가산점",
            area: "가산디지털단지",
            category: "중식",
            rating: "4.7",
            reviewCount: "(6,139)",
            image: .imgSimilar01
        ),
        HomeSimilarStore(
            name: "장관청훠궈 가로수길점",
            area: "가로수길",
            category: "중식",
            rating: "4.6",
            reviewCount: "(18)",
            image: .imgSimilar02
        )
    ]

    static let favoriteStores = [
        HomeFavoriteStore(
            id: 1,
            name: "만가타",
            rating: "4.8",
            category: "유러피안음식",
            area: "삼청",
            image: .imgHomeFav01
        ),
        HomeFavoriteStore(
            id: 2,
            name: "만가타",
            rating: "4.8",
            category: "유러피안음식",
            area: "삼청",
            image: .imgHomeFav02
        )
    ]
}
