//
//  CompareRestaurantView.swift
//  Catchtable-iOS
//
//  Created by dayeon on 11/12/26.
//

import SwiftUI

struct CompareRestaurantView: View {
    @State private var viewModel: CompareRestaurantViewModel
    
    init(role: VoteRole) {
        _viewModel = State(initialValue: CompareRestaurantViewModel(role: role))
    }
    
    var body: some View {
        VStack(spacing: 0) {
            VoteHeader(
                onBack: {},
                onEndVote: viewModel.showEndVoteButton ? { viewModel.endVote() } : nil,
                onShare: viewModel.showShareButton ? {} : nil
            )
            
            ScrollView {
                HStack(alignment: .center, spacing: 0) {
                    ForEach(Array(viewModel.restaurants.enumerated()), id: \.element.id) { index, restaurant in
                        HalfContainer(
                            restaurant: restaurant,
                            isSelected: viewModel.isSelected(restaurant),
                            showCheckbox: viewModel.showCheckbox,
                            onSelect: { viewModel.select(restaurant) },
                            showVoteMemberCard: viewModel.showVoteMemberCard,
                            voteCount: viewModel.voteCount(for: restaurant),
                            voterNames: viewModel.voterNames(for: restaurant),
                            voterLines: viewModel.voterLines,
                            isGray: index % 2 == 1
                        )
                    }
                }
                .padding(.horizontal, 12)
                .padding(.bottom, 24)
            }
            .padding(.top, 20)
            
            CatchTableButton(title: viewModel.buttonTitle, variant: .filled, action: viewModel.bottomButtonTapped)
                .padding(.horizontal, 19)
                .padding(.top, 12)
                .background(.white)
                .disabled(!viewModel.isButtonEnabled)
        }
        .sheet(isPresented: $viewModel.isSheetPresented, onDismiss: viewModel.sheetDismissed) {
            SetNicknameSheet { name in
                viewModel.vote(name: name)
            }
        }
        .fullScreenCover(isPresented: $viewModel.isCompletedPresented) {
            VoteCompletedView(onShowAfterVote: viewModel.showAfterVote)
        }
    }
}
