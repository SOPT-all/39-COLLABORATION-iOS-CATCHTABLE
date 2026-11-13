//
//  HTTPHeader.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/13/26.
//

enum HTTPHeaderField: String {
    case userID = "X-User-Id"
    case contentType = "Content-Type"
    case accept = "Accept"
}

enum ContentType: String {
    case json = "application/json"
}
