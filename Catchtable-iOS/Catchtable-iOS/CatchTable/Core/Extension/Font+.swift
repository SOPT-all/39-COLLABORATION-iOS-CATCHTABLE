//
//  Font+.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/4/26.
//

import SwiftUI

enum PretendardWeight: String {
    case regular = "Pretendard-Regular"
    case medium = "Pretendard-Medium"
    case semiBold = "Pretendard-SemiBold"
    case bold = "Pretendard-Bold"

    static let defaultLineHeightRatio: CGFloat = 1.193
}

enum Typography: CaseIterable {
    case displayB20
    case displayB18
    case displaySb18
    case displayRg18

    case h1B16
    case h1Sb16
    case h1Md16
    case h1Rg16

    case h3B14
    case h3Sb14
    case h3Md14
    case h3Rg14

    case bodyB12
    case bodySb12
    case bodyMd12
    case bodyRg12

    case captionB10
    case captionSb10
    case captionMd10
    case captionB8

    var weight: PretendardWeight {
        switch self {
        case .displayB20, .displayB18, .h1B16, .h3B14, .bodyB12, .captionB10, .captionB8:
            .bold
        case .displaySb18, .h1Sb16, .h3Sb14, .bodySb12, .captionSb10:
            .semiBold
        case .h1Md16, .h3Md14, .bodyMd12, .captionMd10:
            .medium
        case .displayRg18, .h1Rg16, .h3Rg14, .bodyRg12:
            .regular
        }
    }

    var size: CGFloat {
        switch self {
        case .displayB20: 20
        case .displayB18, .displaySb18, .displayRg18: 18
        case .h1B16, .h1Sb16, .h1Md16, .h1Rg16: 16
        case .h3B14, .h3Sb14, .h3Md14, .h3Rg14: 14
        case .bodyB12, .bodySb12, .bodyMd12, .bodyRg12: 12
        case .captionB10, .captionSb10, .captionMd10: 10
        case .captionB8: 8
        }
    }

    var lineHeight: CGFloat {
        switch self {
        case .displayB20: 30
        case .displayB18, .displaySb18, .displayRg18: 27
        case .h1B16, .h1Sb16, .h1Md16, .h1Rg16: 24
        case .h3B14, .h3Sb14, .h3Md14, .h3Rg14: 20
        case .bodyB12, .bodySb12, .bodyMd12, .bodyRg12: 16
        case .captionB10, .captionSb10, .captionMd10: 14
        case .captionB8: 10
        }
    }

    var font: Font {
        .custom(weight.rawValue, size: size)
    }

    var extraLineSpacing: CGFloat {
        let defaultLineHeight = size * PretendardWeight.defaultLineHeightRatio
        return max(lineHeight - defaultLineHeight, 0)
    }
}

struct TypographyModifier: ViewModifier {
    let style: Typography

    func body(content: Content) -> some View {
        content
            .font(style.font)
            .lineSpacing(style.extraLineSpacing)
            .padding(.vertical, style.extraLineSpacing / 2)
    }
}

extension View {
    func typography(_ style: Typography) -> some View {
        modifier(TypographyModifier(style: style))
    }
}

extension Font {
    static func pretendard(_ weight: PretendardWeight, size: CGFloat) -> Font {
        .custom(weight.rawValue, size: size)
    }
}
