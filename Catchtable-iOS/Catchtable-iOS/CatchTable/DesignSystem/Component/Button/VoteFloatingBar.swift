//
//  VoteFloatingBar.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/8/26.
//

import SwiftUI

struct VoteFloatingBar: View {
    var title: String = "함께 고르기 투표 중..."
    let restaurantCount: Int
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 0) {
                Image(.iconGraph)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(.trailing, 12)

                HStack(spacing: 4) {
                    Text(title)
                        .typography(.bodyMd12)
                        .foregroundStyle(.white)

                    Text("·")
                        .typography(.captionMd10)
                        .foregroundStyle(.gray500)

                    Text("\(restaurantCount)개 식당")
                        .typography(.bodyMd12)
                        .foregroundStyle(.gray500)
                }
                .lineLimit(1)

                Spacer(minLength: 0)

                Image(.iconHomeNext)
                    .renderingMode(.template)
                    .resizable()
                    .foregroundStyle(.white)
                    .frame(width: 12, height: 12)
            }
            .frame(height: 36)
            .padding(.horizontal, 12)
            .padding(.vertical, 4)
            .background(Color.gray800, in: .capsule)
        }
        .buttonStyle(.plain)
    }
}
