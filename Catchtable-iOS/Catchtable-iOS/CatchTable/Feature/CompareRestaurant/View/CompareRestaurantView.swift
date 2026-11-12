//
//  CompareRestaurantView.swift
//  Catchtable-iOS
//
//  Created by dayeon on 11/12/26.
//

import SwiftUI

struct CompareRestaurantView: View {
    @State private var viewModel = CompareRestaurantViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            VoteHeader(onBack: {})
            
            ScrollView {
                HStack(alignment: .center, spacing: 0) {
                    ForEach(Array(viewModel.restaurants.enumerated()), id: \.element.id) { index, restaurant in
                        HalfContainer(
                            restaurant: restaurant,
                            isSelected: viewModel.isSelected(restaurant),
                            onSelect: { viewModel.select(restaurant) },
                            isGray: index % 2 == 1
                        )
                    }
                }
                .padding(.horizontal, 12)
            }
            .padding(.top, 20)
            
            ReserveButton(title: viewModel.buttonTitle, action: viewModel.completeVote)
                .padding(.horizontal, 19)
                .padding(.top, 12)
                .background(.white)
                .disabled(!viewModel.isVoted)
        }
    }
}

#Preview {
    CompareRestaurantView()
}
