//
//  HomeHeader.swift
//  Catchtable-iOS
//
//  Created by dayeon on 11/9/26.
//

import SwiftUI

struct HomeHeader: View {
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            Image(.iconCatchtable)
                .resizable()
                .frame(width: 24, height: 24)
            
            HStack(spacing: 10) {
                Image(.iconSearchSm)
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 14, height: 14)
                    .foregroundStyle(.gray400)
                
                Text("혜택을 검색해보세요!")
                    .typography(.h3Md14)
                    .foregroundStyle(.gray400)
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 14)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.gray100)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .overlay(RoundedRectangle(cornerRadius: 30).stroke(.gray200))
            
            Image(.iconHistoryDefault)
                .renderingMode(.template)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundStyle(.gray900)
            
            Image(.iconNotificationDefault)
                .renderingMode(.template)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundStyle(.gray900)
        }
        .padding(.horizontal, 20)
    }
}
