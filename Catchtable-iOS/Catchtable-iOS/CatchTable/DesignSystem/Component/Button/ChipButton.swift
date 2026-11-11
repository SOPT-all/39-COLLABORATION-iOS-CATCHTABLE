//
//  ChipButton.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/9/26.
//

import SwiftUI

struct ChipButton: View {
    enum Style {
        case reserveOutlined
        case viewAll
        case reserveFilled

        var title: String {
            switch self {
            case .reserveOutlined, .reserveFilled: return "예약하기"
            case .viewAll: return "전체보기"
            }
        }

        var textColor: Color {
            switch self {
            case .reserveOutlined: return .orangeBase
            case .viewAll: return .gray900
            case .reserveFilled: return .white
            }
        }

        var backgroundColor: Color {
            switch self {
            case .reserveOutlined: return .orangeBase5
            case .viewAll: return .white
            case .reserveFilled: return .orangeBase
            }
        }

        var borderColor: Color? {
            switch self {
            case .reserveOutlined: return .orangeBase
            case .viewAll: return .gray300
            case .reserveFilled: return nil
            }
        }

        var horizontalPadding: CGFloat {
            switch self {
            case .reserveOutlined, .viewAll: return 13
            case .reserveFilled: return 12
            }
        }

        var chevron: ImageResource? {
            switch self {
            case .reserveOutlined: return .iconVoteNextOrange
            case .viewAll: return .iconVoteNextGray
            case .reserveFilled: return nil
            }
        }
    }

    let style: Style
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Text(style.title)
                    .typography(.bodyB12)
                    .foregroundStyle(style.textColor)

                if let chevron = style.chevron {
                    Image(chevron)
                        .resizable()
                        .frame(width: 8, height: 8)
                }
            }
            .padding(.horizontal, style.horizontalPadding)
            .frame(height: 30)
            .background(style.backgroundColor, in: .rect(cornerRadius: 16))
            .overlay {
                if let borderColor = style.borderColor {
                    RoundedRectangle(cornerRadius: 16)
                        .strokeBorder(borderColor, lineWidth: 1)
                }
            }
        }
        .buttonStyle(.plain)
    }
}
