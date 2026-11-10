//
//  VoteHeader.swift
//  Catchtable-iOS
//
//  Created by dayeon on 11/10/26.
//

import SwiftUI

struct VoteHeader: View {
    let onBack: () -> Void
    var onEndVote: (() -> Void)? = nil
    var onShare: (() -> Void)? = nil
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Button {
                onBack()
            } label: {
                Image(.iconBack)
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 22, height: 22)
            }
            
            Text("함께 고르기")
                .typography(.displayB18)
                .padding(.leading, 16)
            
            Spacer()
            
            if let onEndVote {
                EndVoteButton(action: onEndVote)
            }
            
            if let onShare {
                ShareButton(action: onShare)
            }
            
        }
        .foregroundStyle(.gray900)
        .frame(height: 40)
        .padding(.horizontal, 20)
    }
}

private struct EndVoteButton: View {
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text("투표종료")
                .padding(.vertical, 7)
                .padding(.horizontal, 12)
                .typography(.bodyB12)
                .foregroundStyle(.white)
                .background(.orangeBase)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
}

private struct ShareButton: View {
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(.iconShare24)
                .resizable()
                .frame(width: 24, height: 24)
                .padding(.leading, 12)
                .padding(.trailing, 6)
        }
    }
}
