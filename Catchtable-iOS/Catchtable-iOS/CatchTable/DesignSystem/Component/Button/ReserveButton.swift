//
//  ReserveButton.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/8/26.
//

import SwiftUI

struct ReserveButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
        }
        .buttonStyle(ReserveButtonStyle())
    }
}

private struct ReserveButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .typography(.h1Sb16)
            .foregroundStyle(isEnabled ? Color.white : Color.gray400)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(
                backgroundColor(isPressed: configuration.isPressed),
                in: .rect(cornerRadius: 12)
            )
    }

    private func backgroundColor(isPressed: Bool) -> Color {
        guard isEnabled else { return .gray200 }
        return isPressed ? .orangeBaseClicked : .orangeBase
    }
}
