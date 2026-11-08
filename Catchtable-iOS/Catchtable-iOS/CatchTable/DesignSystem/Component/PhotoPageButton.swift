//
//  PhotoPageButton.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/9/26.
//

import SwiftUI

struct PhotoPageButton: View {
    let currentPage: Int
    let totalPage: Int
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 4) {
                Text("\(currentPage) / \(totalPage)")
                    .typography(.captionSb10)
                    .foregroundStyle(.gray300)

                Text("전체")
                    .typography(.captionB8)
                    .foregroundStyle(.gray100)

                Image(.iconVoteNextWhite)
                    .resizable()
                    .frame(width: 8, height: 8)
            }
            .padding(.horizontal, 9)
            .frame(height: 28)
            .background(Color.black70, in: .rect(cornerRadius: 16))
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .strokeBorder(Color.gray400, lineWidth: 1)
            }
        }
        .buttonStyle(.plain)
    }
}
