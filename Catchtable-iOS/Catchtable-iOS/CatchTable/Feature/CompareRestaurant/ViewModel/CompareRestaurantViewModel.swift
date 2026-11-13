//
//  CompareRestaurantViewModel.swift
//  Catchtable-iOS
//
//  Created by dayeon on 11/12/26.
//

import Foundation

enum VoteRole {
    case host
    case participant
}

enum VotePhase {
    case creating
    case voting
}

@Observable
final class CompareRestaurantViewModel {
    let role: VoteRole
    
    private(set) var phase: VotePhase
    private(set) var restaurants: [CompareRestaurant] = []
    private(set) var candidateIds: Set<UUID> = []
    private(set) var selectedStoreId: UUID?
    private(set) var voters: [UUID: [String]] = [:]
    private(set) var hasVoted = false
    private var pendingVote: String?
    
    var isSheetPresented = false
    var isCompletedPresented = false
    
    init(role: VoteRole) {
        self.role = role
        self.phase = (role == .host) ? .creating : .voting
        self.restaurants = CompareRestaurantMockData.restaurants
        self.candidateIds = Set(restaurants.map { $0.store.id })
    }
    
    var showShareButton: Bool { phase == .voting }
    var showEndVoteButton: Bool { phase == .voting && role == .host }
    
    var showCheckbox: Bool { !hasVoted }
    
    func isSelected(_ restaurant: CompareRestaurant) -> Bool {
        switch phase {
        case .creating: candidateIds.contains(restaurant.store.id)
        case .voting: selectedStoreId == restaurant.store.id
        }
    }
    
    func select(_ restaurant: CompareRestaurant) {
        let id = restaurant.store.id
        
        switch phase {
        case .creating:
            if candidateIds.contains(id) {
                candidateIds.remove(id)
            } else {
                candidateIds.insert(id)
            }
        case .voting:
            guard !hasVoted else { return }
            selectedStoreId = (selectedStoreId == id) ? nil : id
        }
    }
    
    var showVoteMemberCard: Bool {
        voters.values.contains { !$0.isEmpty }
    }
    
    func voteCount(for restaurant: CompareRestaurant) -> Int {
        voters[restaurant.store.id]?.count ?? 0
    }
    
    func voterNames(for restaurant: CompareRestaurant) -> [String] {
        voters[restaurant.store.id] ?? []
    }
    
    var voterLines: Int {
        restaurants.map { voterNames(for: $0).count }.max() ?? 0
    }
    
    var buttonTitle: String {
        switch phase {
        case .creating: "\(candidateIds.count)개 · 투표 링크 공유하기"
        case .voting: selectedStoreId == nil ? "가고 싶은 매장을 투표해주세요" : "매장 선택 완료"
        }
    }
    
    var isButtonEnabled: Bool {
        switch phase {
        case .creating: candidateIds.count >= 2
        case .voting: selectedStoreId != nil
        }
    }
    
    var showBottomButton: Bool { !hasVoted }
    
    func bottomButtonTapped() {
        switch phase {
        case .creating: phase = .voting
        case .voting: isSheetPresented = true
        }
    }
    
    func vote(name: String) {
        pendingVote = name
        isSheetPresented = false
    }
    
    func sheetDismissed() {
        if pendingVote != nil {
            isCompletedPresented = true
        }
    }
    
    func showAfterVote() {
        applyPendingVote()
        isCompletedPresented = false
    }
    
    private func applyPendingVote() {
        guard let id = selectedStoreId, let name = pendingVote else { return }
        voters[id, default: []].append(name)
        selectedStoreId = nil
        hasVoted = true
        pendingVote = nil
    }
    
    func endVote() {
        // TODO: API
    }
}
