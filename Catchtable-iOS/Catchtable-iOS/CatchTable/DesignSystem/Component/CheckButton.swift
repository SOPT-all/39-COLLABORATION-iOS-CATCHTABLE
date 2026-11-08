//
//  CheckButton.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/8/26.
//

import SwiftUI

struct CheckButton: View {
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .strokeBorder(isSelected ? Color.orangeBase : Color.gray300, lineWidth: 1)

                if isSelected {
                    Circle()
                        .fill(Color.orangeBase)
                        .frame(width: 16, height: 16)
                }
            }
            .frame(width: 22, height: 22)
            .padding(1)
            .contentShape(.circle)
        }
        .buttonStyle(.plain)
    }
}

extension CheckButton {
    init(isSelected: Binding<Bool>) {
        self.init(isSelected: isSelected.wrappedValue) {
            isSelected.wrappedValue.toggle()
        }
    }
}
