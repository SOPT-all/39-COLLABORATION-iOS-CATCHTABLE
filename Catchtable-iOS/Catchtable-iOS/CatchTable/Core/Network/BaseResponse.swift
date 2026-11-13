//
//  BaseResponse.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/13/26.
//

import Foundation

struct BaseResponse<T: Decodable>: Decodable {
    let success: Bool
    let code: String
    let message: String
    let data: T?
}

struct EmptyData: Decodable {}
