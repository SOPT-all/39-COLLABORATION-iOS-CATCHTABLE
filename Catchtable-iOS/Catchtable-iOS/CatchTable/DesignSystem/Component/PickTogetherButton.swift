//
//  PickTogetherButton.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/9/26.
//

import SwiftUI

struct PickTogetherButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 2) {
                Image(.iconCompare)
                    .resizable()
                    .frame(width: 12, height: 12)

                Text("함께고르기")
                    .typography(.bodyMd12)
                    .foregroundStyle(.gray900)
            }
            .padding(.horizontal, 12)
            .frame(height: 34)
            .background(Color.white, in: .capsule)
            .overlay {
                Capsule()
                    .strokeBorder(Color.gray200, lineWidth: 1)
            }
        }
        .buttonStyle(.plain)
    }
}
