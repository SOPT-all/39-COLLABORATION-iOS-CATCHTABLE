//
//  VoteDetailResponseDTO.swift
//  Catchtable-iOS
//
//  Created by dayeon on 11/15/26.
//

import Foundation

struct VoteDetailResponseDTO: Decodable {
    let voteID: Int
    let status: String
    let participantCount: Int
    let candidates: [Candidate]
    let viewer: Viewer
    let createdAt: String
    let closedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case status, participantCount, candidates, viewer, createdAt, closedAt
        case voteID = "voteId"
    }
}

extension VoteDetailResponseDTO {
    struct Candidate: Decodable {
        let candidateID: Int
        let displayOrder: Int
        let voteCount: Int
        let voters: [Voter]
        let store: Store
        
        enum CodingKeys: String, CodingKey {
            case displayOrder, voteCount, voters, store
            case candidateID = "candidateId"
        }
    }
    
    struct Voter: Decodable {
        let displayName: String
    }
    
    struct Store: Decodable {
        let storeID: Int
        let name: String
        let rating: Double
        let reviewCount: Int
        let imageURLs: [String]
        let station: Station
        let aiSummary: AISummary?
        let priceRange: String
        let representativeMenus: [Menu]
        let amenities: [Amenity]
        
        enum CodingKeys: String, CodingKey {
            case name, rating, reviewCount, station, aiSummary
            case priceRange, representativeMenus, amenities
            case storeID = "storeId"
            case imageURLs = "imageUrls"
        }
    }
    
    struct Station: Decodable {
        let name: String
        let lines: [String]
        let distanceMeters: Int
    }
    
    struct AISummary: Decodable {
        let title: String
        let lines: [String]
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
    
    struct Amenity: Decodable {
        let category: String
        let content: String
    }
    
    struct Viewer: Decodable {
        let userID: Int
        let isHost: Bool
        let hasVoted: Bool
        let selectedCandidateID: Int?
        let displayName: String?
        let defaultNickname: String
        
        enum CodingKeys: String, CodingKey {
            case isHost, hasVoted, displayName, defaultNickname
            case userID = "userId"
            case selectedCandidateID = "selectedCandidateId"
        }
    }
}

extension VoteDetailResponseDTO {
    func toModel() -> VoteDetail {
        VoteDetail(
            id: voteID,
            status: VoteStatus(rawValue: status) ?? .closed,
            participantCount: participantCount,
            restaurants: candidates
                .sorted { $0.displayOrder < $1.displayOrder }
                .map { $0.toModel() },
            viewer: viewer.toModel()
        )
    }
}

private extension VoteDetailResponseDTO.Candidate {
    func toModel() -> CompareRestaurant {
        CompareRestaurant(
            store: store.toModel(),
            station: store.station.toModel(),
            menus: store.representativeMenus
                .sorted { $0.displayOrder < $1.displayOrder }
                .compactMap { $0.toModel() },
            corkages: store.amenities
                .filter { $0.category == "LIQUOR_CORKAGE" }
                .enumerated()
                .map { CorkageInfo(id: $0.offset, content: $0.element.content) },
            candidateID: candidateID,
            voteCount: voteCount,
            voterNames: voters.map(\.displayName)
        )
    }
}

private extension VoteDetailResponseDTO.Store {
    func toModel() -> VoteStore {
        VoteStore(
            id: storeID,
            image: imageURLs.first
                .flatMap(URL.init(string:))
                .map { .remote($0) },
            name: name,
            rating: String(format: "%.1f", rating),
            reviewCount: reviewCount.formatted(),
            summary: aiSummary?.title ?? "",
            priceRange: priceRange
        )
    }
}

// TODO: 주희언니 코드 머지 후 변경
//private extension VoteDetailResponseDTO.Station {
//    func toModel() -> SubwayStation {
//        SubwayStation(
//            lines: lines.compactMap(Line.init(name:)),
//            name: name,
//            distance: distanceMeters
//        )
//    }
//}

private extension VoteDetailResponseDTO.Station {
    func toModel() -> SubwayStation {
        SubwayStation(
            lines: lines.compactMap(Self.line(from:)),
            name: name,
            distance: distanceMeters
        )
    }
    
    static func line(from name: String) -> Line? {
        switch name {
        case "1": .line1
        case "2": .line2
        case "3": .line3
        case "4": .line4
        case "5": .line5
        case "6": .line6
        case "7": .line7
        case "8": .line8
        case "9": .line9
        case "신분당": .lineShinbundang
        case "수인분당": .lineSuinbundang
        case "경춘": .lineGyeongchun
        case "경의중앙": .lineGyeonguijungang
        default: nil
        }
    }
}

private extension VoteDetailResponseDTO.Menu {
    func toModel() -> MainMenuInfo? {
        guard let url = URL(string: imageURL) else { return nil }
        return MainMenuInfo(
            id: menuID,
            image: .remote(url),
            name: name,
            price: price,
            isPriceOver: isPriceFrom
        )
    }
}

private extension VoteDetailResponseDTO.Viewer {
    func toModel() -> VoteViewer {
        VoteViewer(
            isHost: isHost,
            hasVoted: hasVoted,
            selectedCandidateID: selectedCandidateID,
            defaultNickname: defaultNickname
        )
    }
}
