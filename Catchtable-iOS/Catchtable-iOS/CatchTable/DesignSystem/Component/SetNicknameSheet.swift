//
//  SetNicknameSheet.swift
//  Catchtable-iOS
//
//  Created by dayeon on 11/8/26.
//

import SwiftUI

enum NameType {
    case anonymous
    case nickname
}

struct SetNicknameSheet: View {
    @State private var nameType: NameType? = nil
    @State private var nickname: String = "우수한 셀럽_121"
    
    let onVote: (String) -> Void
    let maxCount: Int = 12
    private var inputCount: Int { nickname.count }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("어떤 방식으로 투표할까요?")
                .typography(.displayB18)
                .foregroundStyle(.gray900)
                .padding(.top, 47)
            
            Rectangle()
                .fill(.gray200)
                .frame(maxWidth: .infinity)
                .frame(height: 1)
                .padding(.top, 10)
            
            radioRow(title: "익명", isSelected: nameType == .anonymous) {
                nameType = .anonymous
            }
            .padding(.top, 34)
            
            if nameType == .anonymous {
                anonymousField
                    .padding(.top, 10)
            }
            
            radioRow(title: "닉네임", isSelected: nameType == .nickname) {
                nameType = .nickname
            }
            .padding(.top, 16)
            
            if nameType == .nickname {
                nicknameField
                    .padding(.top, 10)
            }
            
            CatchTableButton(title: "이 이름으로 투표하기", variant: .filled) {
                onVote(nameType == .anonymous ? "익명1" : nickname)
            }
            .disabled(nameType == nil || (nameType == .nickname && nickname.isEmpty))
            .padding(.top, 36)
        }
        .padding(.horizontal, 20)
        .fixedSize(horizontal: false, vertical: true)
        .frame(maxHeight: .infinity, alignment: .top)
        .presentationDetents([.height(372)])
        .presentationDragIndicator(.visible)
        .presentationBackground(.white)
    }
    
    private func radioRow(title: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
        HStack(spacing: 12) {
            CheckButton(isSelected: isSelected, action: action)
                .animation(.easeInOut(duration: 0.2), value: isSelected)
            
            Text(title)
                .typography(.h3Md14)
                .foregroundStyle(.gray900)
        }
    }
    
    private var anonymousField: some View {
        Text("익명1")
            .typography(.h3Md14)
            .foregroundStyle(.gray900)
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.gray100)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    private var nicknameField: some View {
        HStack(alignment: .bottom, spacing: 0) {
            TextField (
                "nickname",
                text: $nickname,
                prompt: Text("닉네임을 입력해주세요.")
                    .foregroundStyle(.gray200)
            )
            .typography(.h3Md14)
            .foregroundStyle(.gray900)
            .tint(.orangeBase)
            
            Spacer()
            
            Text("\(inputCount)/\(maxCount)자")
                .typography(.captionMd10)
                .foregroundStyle(inputCount >= maxCount ? .orangeBase : .gray900)
        }
        .padding(12)
        .frame(maxWidth: .infinity)
        .background(.gray100)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
