//
//  CompareRestaurantView.swift
//  Catchtable-iOS
//
//  Created by dayeon on 11/12/26.
//

import SwiftUI

struct CompareRestaurantView: View {
    private let left = CompareRestaurantMockData.restaurants[0]
    private let right = CompareRestaurantMockData.restaurants[1]

    @State private var isLeftSelected = false
    @State private var isRightSelected = false

    var body: some View {
        VStack(spacing: 0) {
            VoteHeader(onBack: {})

            ScrollView {
                HStack(alignment: .center, spacing: 0) {
                    HalfContainer(restaurant: left, isSelected: $isLeftSelected, isGray: false)
                    HalfContainer(restaurant: right, isSelected: $isRightSelected, isGray: true)
                }
                .padding(.horizontal, 12)
            }
            .padding(.top, 20)

            ReserveButton(title: isLeftSelected || isRightSelected ? "매장 선택 완료" : "가고 싶은 매장을 투표해주세요", action: {})
                .padding(.horizontal, 19)
        }
    }
}

#Preview {
    CompareRestaurantView()
}
