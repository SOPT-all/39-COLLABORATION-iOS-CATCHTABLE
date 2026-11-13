//
//  NetworkError.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/13/26.
//

import Foundation

enum NetworkError: Error {
    case invalidBaseURL
    case invalidURL
    case encodingFailed(Error)
    case transportFailed(Error)
    case invalidResponse
    case decodingFailed(Error)
    case emptyData
    case server(statusCode: Int, code: APIErrorCode, message: String)
}
