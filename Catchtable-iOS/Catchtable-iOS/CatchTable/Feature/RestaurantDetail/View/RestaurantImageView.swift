//
//  RestaurantImageView.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/10/26.
//

import SwiftUI

import Kingfisher

struct RestaurantImageView: View {
    let source: RestaurantImageSource

    var body: some View {
        switch source {
        case .asset(let resource):
            Image(resource)
                .resizable()
        case .remote(let url):
            KFImage(url)
                .resizable()
        }
    }
}
