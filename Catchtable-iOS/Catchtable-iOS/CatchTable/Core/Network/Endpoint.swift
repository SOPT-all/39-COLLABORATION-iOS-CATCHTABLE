//
//  Endpoint.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/13/26.
//

import Foundation

protocol Endpoint {
    var path: String { get }
    var method: HTTPMethod { get }
    var queryItems: [URLQueryItem] { get }
    var body: (any Encodable)? { get }
}

extension Endpoint {
    var queryItems: [URLQueryItem] { [] }
    var body: (any Encodable)? { nil }

    func makeURLRequest(baseURL: URL, headers: [String: String]) throws -> URLRequest {
        var components = URLComponents(
            url: baseURL.appending(path: path),
            resolvingAgainstBaseURL: false
        )
        if !queryItems.isEmpty {
            components?.queryItems = queryItems
        }

        guard let url = components?.url else { throw NetworkError.invalidURL }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        headers.forEach { field, value in
            request.setValue(value, forHTTPHeaderField: field)
        }

        if let body {
            do {
                request.httpBody = try JSONEncoder().encode(body)
            } catch {
                throw NetworkError.encodingFailed(error)
            }
            request.setValue(
                ContentType.json.rawValue,
                forHTTPHeaderField: HTTPHeaderField.contentType.rawValue
            )
        }

        return request
    }
}
