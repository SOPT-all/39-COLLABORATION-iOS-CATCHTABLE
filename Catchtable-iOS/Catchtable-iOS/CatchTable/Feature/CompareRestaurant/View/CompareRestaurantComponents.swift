//
//  CompareRestaurantComponents.swift
//  Catchtable-iOS
//
//  Created by dayeon on 11/12/26.
//

import SwiftUI

var pinkGradient: LinearGradient {
    LinearGradient(
        colors: [Color("pinkGradientStart"), Color("pinkGradientEnd")],
        startPoint: .top,
        endPoint: .bottom
    )
}

struct CardVoteStore: View {
    let store: VoteStore
    let isSelected: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ZStack(alignment: .topTrailing) {
                Image(store.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 148, height: 148)
                    .clipShape(.rect(cornerRadius: 16))
                
                Image(isSelected ? .btnSelectionSelected : .btnSelectionCheck)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(.trailing, 12)
                    .padding(.top, 12)
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text(store.name)
                    .typography(.h3B14)
                    .foregroundStyle(.gray900)
                
                HStack(alignment: .center, spacing: 0) {
                    Image(.iconStarSm)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 12, height: 12)
                        .foregroundStyle(.accentYellow)
                    
                    Text(store.rating)
                        .typography(.bodyRg12)
                        .foregroundStyle(.gray900)
                        .padding(.leading, 4)
                    
                    Text("(\(store.reviewCount))")
                        .typography(.bodyRg12)
                        .foregroundStyle(.gray500)
                }
            }
        }
    }
}

struct SubwayCard: View {
    let station: SubwayStation
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 4) {
                ForEach(station.lines, id: \.self) { line in
                    SubwayLineLabel(line: line)
                }
            }
            
            Text("\(station.name)에서 \(station.distance)m")
                .typography(.bodyB12)
                .foregroundStyle(.gray900)
        }
    }
}

struct AISummaryCard: View {
    let store: VoteStore
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .center, spacing: 2) {
                Image(.iconSparkleSm)
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 12, height: 12)
                    .foregroundStyle(pinkGradient)
                
                HStack(alignment: .center, spacing: 4) {
                    Text("AI")
                        .typography(.h3B14)
                        .foregroundStyle(pinkGradient)
                    
                    Text("요약")
                        .typography(.h3B14)
                        .foregroundStyle(.gray900)
                }
            }
            
            Text(store.summary)
                .typography(.bodyRg12)
                .foregroundStyle(.gray600)
        }
    }
}
