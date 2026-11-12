//
//  CatchTableButton.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/8/26.
//

import SwiftUI

struct CatchTableButton: View {
    enum Variant {
        case filled
        case outlined
    }

    let title: String
    var variant: Variant = .filled
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
        }
        .buttonStyle(CatchTableButtonStyle(variant: variant))
    }
}

private struct CatchTableButtonStyle: ButtonStyle {
    let variant: CatchTableButton.Variant

    @Environment(\.isEnabled) private var isEnabled

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .typography(.h1Sb16)
            .foregroundStyle(foregroundColor(isPressed: configuration.isPressed))
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(
                backgroundColor(isPressed: configuration.isPressed),
                in: .rect(cornerRadius: 12)
            )
            .overlay {
                if variant == .outlined, isEnabled {
                    RoundedRectangle(cornerRadius: 12)
                        .strokeBorder(Color.gray200, lineWidth: 1)
                }
            }
    }

    private func foregroundColor(isPressed: Bool) -> Color {
        guard isEnabled else { return .gray300 }
        switch variant {
        case .filled: return isPressed ? .gray100 : .white
        case .outlined: return .gray900
        }
    }

    private func backgroundColor(isPressed: Bool) -> Color {
        guard isEnabled else { return .black4 }
        switch variant {
        case .filled: return isPressed ? .orangeBaseClicked : .orangeBase
        case .outlined: return .white
        }
    }
}
