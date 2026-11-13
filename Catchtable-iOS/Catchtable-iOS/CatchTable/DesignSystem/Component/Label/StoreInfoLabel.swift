//
//  StoreInfoLabel.swift
//  Catchtable-iOS
//
//  Created by dayeon on 11/8/26.
//

import SwiftUI

struct StoreInfoLabel: View {
    let infoText: String
    var isIcon: Bool = false
    
    var body: some View {
        HStack(spacing: 4) {
            Text(infoText)
                .typography(.captionMd10)
                .foregroundStyle(.coolGray600)
            
            if isIcon == true {
                Image(.iconQuestion)
                    .renderingMode(.template)
                    .resizable()
                    .foregroundStyle(.coolGray600)
                    .frame(width: 12, height: 12)
            }
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 4)
        .background(.coolGray200)
        .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}
