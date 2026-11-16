//
//  SubwayLineLabel.swift
//  Catchtable-iOS
//
//  Created by dayeon on 11/8/26.
//

import SwiftUI

enum Line {
    case line1
    case line2
    case line3
    case line4
    case line5
    case line6
    case line7
    case line8
    case line9
    case lineShinbundang
    case lineSuinbundang
    case lineGyeongchun
    case lineGyeonguijungang
    
    var name: String {
        switch self {
        case .line1: return "1"
        case .line2: return "2"
        case .line3: return "3"
        case .line4: return "4"
        case .line5: return "5"
        case .line6: return "6"
        case .line7: return "7"
        case .line8: return "8"
        case .line9: return "9"
        case .lineShinbundang: return "신분당"
        case .lineSuinbundang: return "수인분당"
        case .lineGyeongchun: return "경춘"
        case .lineGyeonguijungang: return "경의중앙"
        }
    }
    
    var color: Color {
        switch self {
        case .line1: return Color("line1")
        case .line2: return Color("line2")
        case .line3: return Color("line3")
        case .line4: return Color("line4")
        case .line5: return Color("line5")
        case .line6: return Color("line6")
        case .line7: return Color("line7")
        case .line8: return Color("line8")
        case .line9: return Color("line9")
        case .lineShinbundang: return Color("line_shinbundang")
        case .lineSuinbundang: return Color("line_suinbundang")
        case .lineGyeongchun: return Color("line_gyeongchun")
        case .lineGyeonguijungang: return Color("line_gyeonguijungang")
        }
    }
    
    var isLineNameNumber: Bool {
        switch self {
        case .line1, .line2, .line3, .line4, .line5, .line6, .line7, .line8, .line9:
            return true
        
        default:
            return false
        }
    }
}

extension Line: CaseIterable {
    init?(name: String) {
        guard let line = Self.allCases.first(where: { $0.name == name }) else { return nil }
        self = line
    }
}

struct SubwayLineLabel: View {
    let line: Line
    
    var body: some View {
        Text(line.name)
            .typography(.captionB8)
            .foregroundStyle(.white)
            .padding(.horizontal, line.isLineNameNumber ? 0 : 6)
            .frame(width: line.isLineNameNumber ? 16 : nil, height: 16)
            .background(
                line.color,
                in: line.isLineNameNumber ? AnyShape(.circle) : AnyShape(.capsule)
            )
    }
}
