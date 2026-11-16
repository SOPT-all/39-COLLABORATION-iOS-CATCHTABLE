//
//  CompareRestaurantViewModel.swift
//  Catchtable-iOS
//
//  Created by dayeon on 11/12/26.
//

import Foundation
import Observation

enum VoteRole {
    case host
    case participant
}

enum VotePhase {
    case creating
    case voting
}

@MainActor
@Observable
final class CompareRestaurantViewModel {
    let role: VoteRole
    
    private let voteService: any VoteServiceProtocol
    
    private(set) var phase: VotePhase
    private(set) var restaurants: [CompareRestaurant] = []
    private(set) var candidateIds: Set<Int> = []
    private(set) var selectedStoreId: Int?
    private(set) var voters: [Int: [String]] = [:]
    private(set) var hasVoted = false
    private(set) var isVoteResultVisible = false
    private(set) var voteId: Int?
    private(set) var errorMessage: String?
    private(set) var isCreatingVote = false
    private(set) var voteDetail: VoteDetail?
    var isErrorAlertPresented = false
    
    var isSheetPresented = false
    var isCompletedPresented = false
    var isShareButtonVisible: Bool { phase == .voting }
    var isEndVoteButtonVisible: Bool {
        guard phase == .voting else { return false }
        guard let voteDetail else { return role == .host }
        return voteDetail.viewer.isHost && voteDetail.isOpen
    }
    var isCheckboxVisible: Bool { !isVoteResultVisible }
    
    var isVoteMemberCardVisible: Bool {
        isVoteResultVisible && voters.values.contains { !$0.isEmpty }
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
        case .creating: candidateIds.count == 2 && !isCreatingVote
        case .voting: selectedStoreId != nil
        }
    }
    
    var isBottomButtonVisible: Bool { !isVoteResultVisible }
    
    var defaultNickname: String {
        voteDetail?.viewer.defaultNickname ?? ""
    }
    
    init(role: VoteRole, voteID: Int? = nil, voteService: any VoteServiceProtocol = VoteService()) {
        self.role = role
        self.voteService = voteService
        self.voteId = voteID
        self.phase = (role == .host && voteID == nil) ? .creating : .voting
        
        if voteID == nil {
            self.restaurants = CompareRestaurantMockData.restaurants
            self.candidateIds = Set(restaurants.map { $0.store.id })
        }
    }
    
    func isSelected(_ restaurant: CompareRestaurant) -> Bool {
        switch phase {
        case .creating: candidateIds.contains(restaurant.id)
        case .voting: selectedStoreId == restaurant.id
        }
    }
    
    func voteCount(for restaurant: CompareRestaurant) -> Int {
        voters[restaurant.id]?.count ?? 0
    }
    
    func voterNames(for restaurant: CompareRestaurant) -> [String] {
        voters[restaurant.id] ?? []
    }
    
    func select(_ restaurant: CompareRestaurant) {
        let id = restaurant.id
        
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
    
    func bottomButtonTapped() {
        switch phase {
        case .creating: Task { await createVote() }
        case .voting: isSheetPresented = true
        }
    }
    
    func vote(name: String) {
        guard let id = selectedStoreId else { return }
        voters[id, default: []].append(name)
        hasVoted = true
        isSheetPresented = false
    }
    
    func sheetDismissed() {
        if hasVoted && !isVoteResultVisible {
            isCompletedPresented = true
        }
    }
    
    func showAfterVote() {
        isVoteResultVisible = true
        selectedStoreId = nil
        isCompletedPresented = false
    }
    
    func load() async {
        guard let voteId, voteDetail == nil else { return }
        await fetchVoteDetail(voteID: voteId)
    }
    
    func endVote() {
        // TODO: API
    }
}

private extension CompareRestaurantViewModel {
    func createVote() async {
        guard isButtonEnabled, phase == .creating else { return }
        isCreatingVote = true
        defer { isCreatingVote = false }

        let storeIDs = restaurants.map(\.id).filter { candidateIds.contains($0) }

        do {
            let voteID = try await voteService.createVote(storeIDs: storeIDs)
            voteId = voteID
            phase = .voting
            await fetchVoteDetail(voteID: voteID)
        } catch is CancellationError {
            return
        } catch {
            showError(error.localizedDescription)
        }
    }

    func fetchVoteDetail(voteID: Int) async {
        do {
            let detail = try await voteService.fetchVoteDetail(voteID: voteID)
            apply(detail)
        } catch is CancellationError {
            return
        } catch {
            showError(error.localizedDescription)
        }
    }

    func apply(_ detail: VoteDetail) {
        voteDetail = detail
        voteId = detail.id
        phase = .voting
        restaurants = detail.restaurants
        voters = Dictionary(
            detail.restaurants.map { ($0.id, $0.voterNames) },
            uniquingKeysWith: { first, _ in first }
        )
        hasVoted = detail.viewer.hasVoted
        isVoteResultVisible = detail.viewer.hasVoted || !detail.isOpen
    }

    func showError(_ message: String) {
        errorMessage = message
        isErrorAlertPresented = true
    }
}
