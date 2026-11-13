//
//  VoteCompletedView.swift
//  Catchtable-iOS
//
//  Created by dayeon on 11/12/26.
//

import SwiftUI

struct VoteCompletedView: View {
    let onShowAfterVote: () -> Void
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Spacer()
            
            ZStack(alignment: .center) {
                Circle()
                    .foregroundStyle(.orangeBase5)
                    .frame(width: 60, height: 60)
                    .overlay(Circle().stroke(.orangeBase, lineWidth: 2))
                
                Image(.iconCheckLg)
                    .renderingMode(.template)
                    .resizable()
                    .foregroundStyle(.orangeBase)
                    .frame(width: 28, height: 28)
            }
            
            VStack(alignment: .center, spacing: 0) {
                Text("가고 싶은 매장")
                Text("투표 완료")
            }
            .typography(.displayB20)
            .foregroundStyle(.gray800)
            .padding(.top, 28)
            
            Text("아래 버튼을 눌러\n투표 현황을 확인해보세요")
                .typography(.bodySb12)
                .foregroundStyle(.gray500)
                .padding(.top, 16)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            CatchTableButton(title: "투표 현황 보러가기", variant: .outlined, action: onShowAfterVote)
        }
        .padding(.horizontal, 20)
        .background(.white, ignoresSafeAreaEdges: .bottom)
    }
}
