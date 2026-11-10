//
//  StoreHeader.swift
//  Catchtable-iOS
//
//  Created by dayeon on 11/10/26.
//

import SwiftUI

struct StoreHeader: View {
    var onBack: () -> Void
    var onHome: () -> Void
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            HStack(spacing: 16) {
                HeaderButton(image: .iconBack, action: onBack)
                HeaderButton(image: .iconHome, action: onHome)
            }
            
            Spacer()
            
            HStack(spacing: 16) {
                HeaderIcon(image: .iconSearchLg)
                HeaderIcon(image: .iconBookmark20)
                HeaderIcon(image: .iconShare20)
            }
            
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 20)
    }
}

private struct HeaderButton: View {
    let image: ImageResource
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(image)
                .renderingMode(.template)
                .resizable()
                .frame(width: 22, height: 22)
                .foregroundStyle(.gray900)
        }
    }
}

private struct HeaderIcon: View {
    let image: ImageResource
    
    var body: some View {
        Image(image)
            .renderingMode(.template)
            .resizable()
            .frame(width: 20, height: 20)
            .foregroundStyle(.gray900)
    }
}

#Preview {
    StoreHeader(
        onBack: { print("back") },
        onHome: { print("home") }
    )
}
