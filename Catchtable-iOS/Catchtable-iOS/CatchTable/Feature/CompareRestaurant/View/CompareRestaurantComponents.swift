//
//  CompareRestaurantComponents.swift
//  Catchtable-iOS
//
//  Created by dayeon on 11/12/26.
//

import SwiftUI

struct VoteStoreCard: View {
    let store: VoteStore
    let isSelected: Bool
    let showCheckbox: Bool
    let onSelect: () -> Void
    let onReserve: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ZStack(alignment: .topTrailing) {
                Image(store.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 148, height: 148)
                    .clipShape(.rect(cornerRadius: 16))
                
                if showCheckbox {
                    Button(action: onSelect) {
                        Image(isSelected ? .btnSelectionSelected : .btnSelectionCheck)
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(.trailing, 12)
                            .padding(.top, 12)
                    }
                    .buttonStyle(.plain)
                }
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
                        .typography(.bodyMd12)
                        .foregroundStyle(.gray900)
                        .padding(.leading, 4)
                    
                    Text(" (\(store.reviewCount))")
                        .typography(.bodyRg12)
                        .foregroundStyle(.gray500)
                }
            }
            
            ChipButton(style: .reserveOutlined, action: onReserve)
                .padding(.top, 44)
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
                    .foregroundStyle(LinearGradient.pinkGradient)
                
                HStack(alignment: .center, spacing: 4) {
                    Text("AI")
                        .typography(.h3B14)
                        .foregroundStyle(LinearGradient.pinkGradient)
                    
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

struct PriceRangeCard: View {
    let store: VoteStore
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            CardTitle(title: "가격대")
            
            Text(store.priceRange)
                .typography(.bodyRg12)
                .foregroundStyle(.gray600)
        }
    }
}

struct MainMenuInfoCard: View {
    let info: MainMenuInfo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(info.image)
                .resizable()
                .scaledToFill()
                .frame(width: 68, height: 68)
                .clipShape(.rect(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(info.name)
                    .typography(.bodyB12)
                    .foregroundStyle(.gray900)
                
                HStack(alignment: .center, spacing: 0) {
                    Text("\(info.price.formatted())원\(info.priceOver ? " ~" : "")")
                        .typography(.bodyRg12)
                        .foregroundStyle(.gray500)
                }
            }
        }
    }
}

struct MainMenuCard: View {
    let menus: [MainMenuInfo]
    var onTap: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            CardTitle(title: "대표 메뉴")
            
            HStack(alignment: .top, spacing: 12) {
                ForEach(menus) { menu in
                    MainMenuInfoCard(info: menu)
                }
            }
            
            ChipButton(style: .viewAll, action: onTap)
                .padding(.top, 10)
        }
    }
}

struct CorkageCard: View {
    let corkages: [CorkageInfo]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            CardTitle(title: "주류 및 콜키지")
            
            VStack(alignment: .leading, spacing: 2) {
                ForEach(corkages) { corkage in
                    Text("- \(corkage.type): 병당 \(corkage.price)")
                        .typography(.bodyRg12)
                        .foregroundStyle(.gray600)
                }
            }
        }
    }
}

struct VoteMemberCard: View {
    let count: Int
    let names: [String]
    let voterLines: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            CardTitle(title: "\(count)명 투표")
            
            if voterLines > 0 {
                VStack(alignment: .leading, spacing: 4) {
                    ForEach(Array(names.enumerated()), id: \.offset) {_, name in
                        VoteMemberRow(name: name)
                    }
                    
                    ForEach(0..<max(0, voterLines - names.count), id: \.self) { _ in
                        VoteMemberRow(name: " ").hidden()
                    }
                }
            }
        }
    }
}

struct VoteMemberRow: View {
    let name: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            Image(.iconProfile)
                .resizable()
                .frame(width: 14, height: 14)
            
            Text(name)
                .typography(.bodyRg12)
                .foregroundStyle(.gray600)
                .lineLimit(1)
        }
    }
}

struct CardTitle: View {
    let title: String
    
    var body: some View {
        Text(title)
            .typography(.h3B14)
            .foregroundStyle(.gray900)
    }
}

struct HalfContainer: View {
    let restaurant: CompareRestaurant
    let isSelected: Bool
    let showCheckbox: Bool
    let onSelect: () -> Void
    let showVoteMemberCard: Bool
    let voteCount: Int
    let voterNames: [String]
    let voterLines: Int
    var isGray: Bool
    
    let cardWidth: CGFloat = 148
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            VoteStoreCard(
                store: restaurant.store,
                isSelected: isSelected,
                showCheckbox: showCheckbox,
                onSelect: onSelect,
                onReserve: {}
            )
            .padding(.horizontal, 12)
            
            CardDivider(isGray: isGray)
            
            if showVoteMemberCard {
                VoteMemberCard(count: voteCount, names: voterNames, voterLines: voterLines)
                    .frame(width: cardWidth, alignment: .leading)
                    .padding(.horizontal, 12)
                
                CardDivider(isGray: isGray)
            }
            
            SubwayCard(station: restaurant.station)
                .frame(width: cardWidth, alignment: .leading)
                .padding(.horizontal, 12)
            
            CardDivider(isGray: isGray)
            
            AISummaryCard(store: restaurant.store)
                .frame(width: cardWidth, alignment: .leading)
                .padding(.horizontal, 12)
            
            CardDivider(isGray: isGray)
            
            PriceRangeCard(store: restaurant.store)
                .frame(width: cardWidth, alignment: .leading)
                .padding(.horizontal, 12)
            
            CardDivider(isGray: isGray)
            
            MainMenuCard(menus: restaurant.menus, onTap: {})
                .frame(width: cardWidth, alignment: .leading)
                .padding(.horizontal, 12)
            
            CardDivider(isGray: isGray)
            
            CorkageCard(corkages: restaurant.corkages)
                .frame(width: cardWidth, alignment: .leading)
                .padding(.horizontal, 12)
        }
        .padding(.vertical, 12)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(isGray ? .gray100 : .white)
    }
}

struct CardDivider: View {
    var isGray: Bool
    
    var body: some View {
        Rectangle()
            .frame(maxWidth: .infinity)
            .frame(height: 1)
            .overlay(isGray ? .white : .gray200)
    }
}
