//
//  StoreHeader.swift
//  Catchtable-iOS
//
//  Created by dayeon on 11/10/26.
//

import SwiftUI

struct StoreHeader: View {
    let onBack: () -> Void
    let onHome: () -> Void
    let isBookmarked: Bool
    let onBookmark: () -> Void
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            HStack(spacing: 16) {
                HeaderButton(image: .iconBack, action: onBack)
                HeaderButton(image: .iconHome, action: onHome)
            }
            
            Spacer()
            
            HStack(spacing: 16) {
                HeaderIcon(image: .iconSearchLg)
                
                Button {
                    onBookmark()
                } label: {
                    Image(isBookmarked ? .iconBookmarkFilled20 : .iconBookmark20)
                        .renderingMode(.template)
                        .resizable()
                        .foregroundStyle(isBookmarked ? .orangeBase : .gray900)
                        .frame(width: 20, height: 20)
                }
                HeaderIcon(image: .iconShare20)
            }
            
        }
        .frame(height: 40)
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
        .buttonStyle(.plain)
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
