//
//  HomeViewModel.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/9/26.
//

import Observation

@Observable
final class HomeViewModel {
    private(set) var userName = HomeMockData.userName
    private(set) var areas = HomeMockData.areas
    private(set) var recentStores = HomeMockData.recentStores
    private(set) var similarStores = HomeMockData.similarStores
    private(set) var favoriteStores = HomeMockData.favoriteStores
    private(set) var activeVote: HomeActiveVote?

    private let service: any HomeServiceProtocol

    init(service: any HomeServiceProtocol = HomeService()) {
        self.service = service
    }

    func fetchMyActiveVote() async {
        do {
            activeVote = try await service.fetchMyActiveVote()
        } catch {
            activeVote = nil
        }
    }
}
