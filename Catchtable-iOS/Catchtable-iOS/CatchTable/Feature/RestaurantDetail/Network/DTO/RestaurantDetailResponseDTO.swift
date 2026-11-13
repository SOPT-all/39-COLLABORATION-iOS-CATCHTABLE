//
//  RestaurantDetailResponseDTO.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/14/26.
//

import Foundation

struct RestaurantDetailResponseDTO: Decodable {
    let name: String
    let category: String
    let region: String
    let intro: String
    let rating: Double
    let reviewCount: Int
    let station: Station
    let priceRange: String
    let businessHours: String
    let phone: String
    let imageURLs: [String]
    let representativeMenus: [Menu]
    let aiSummary: AISummary?
    let amenities: [Amenity]

    enum CodingKeys: String, CodingKey {
        case name, category, region, intro, rating, reviewCount, station
        case priceRange, businessHours, phone, representativeMenus, aiSummary, amenities
        case imageURLs = "imageUrls"
    }
}

extension RestaurantDetailResponseDTO {
    struct Station: Decodable {
        let name: String
        let lines: [String]
        let distanceMeters: Int
    }

    struct Menu: Decodable {
        let menuID: Int
        let name: String
        let price: Int
        let isPriceFrom: Bool
        let imageURL: String
        let displayOrder: Int

        enum CodingKeys: String, CodingKey {
            case name, price, isPriceFrom, displayOrder
            case menuID = "menuId"
            case imageURL = "imageUrl"
        }
    }

    struct AISummary: Decodable {
        let title: String
        let lines: [String]
    }

    struct Amenity: Decodable {
        let category: String
        let content: String
    }
}

extension RestaurantDetailResponseDTO {
    func toModel() -> RestaurantDetail {
        RestaurantDetail(
            name: name,
            introduction: intro,
            area: region,
            category: category,
            rating: rating,
            reviewCount: reviewCount,
            photos: imageURLs.enumerated().compactMap { index, urlString in
                guard let url = URL(string: urlString) else { return nil }
                return RestaurantPhoto(id: index, image: .remote(url))
            },
            location: station.toModel(),
            priceRange: priceRange,
            businessHours: businessHours,
            phoneNumber: phone,
            amenities: amenities.compactMap { $0.toModel() },
            menus: representativeMenus
                .sorted { $0.displayOrder < $1.displayOrder }
                .compactMap { $0.toModel() },
            aiSummary: aiSummary?.toModel()
        )
    }
}

private extension RestaurantDetailResponseDTO.Station {
    func toModel() -> RestaurantLocation {
        RestaurantLocation(
            lines: lines.compactMap(Line.init(name:)),
            stationName: name,
            distanceMeters: distanceMeters
        )
    }
}

private extension RestaurantDetailResponseDTO.Menu {
    func toModel() -> RestaurantMenu? {
        guard let url = URL(string: imageURL) else { return nil }
        return RestaurantMenu(
            id: menuID,
            name: name,
            price: price,
            image: .remote(url),
            isPriceFrom: isPriceFrom
        )
    }
}

private extension RestaurantDetailResponseDTO.AISummary {
    func toModel() -> RestaurantAISummary {
        RestaurantAISummary(title: title, points: lines)
    }
}

private extension RestaurantDetailResponseDTO.Amenity {
    enum Category: String {
        case parking = "PARKING"
        case liquorCorkage = "LIQUOR_CORKAGE"

        var title: String {
            switch self {
            case .parking: "주차"
            case .liquorCorkage: "콜키지"
            }
        }
    }

    func toModel() -> RestaurantAmenity? {
        guard let category = Category(rawValue: category) else { return nil }
        return RestaurantAmenity(title: category.title)
    }
}
