//
//  APIConfig.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/13/26.
//

import Foundation

enum APIConfig {
    private enum InfoKey: String {
        case baseURL = "BASE_URL"
        case userID = "USER_ID"
    }

    static var baseURL: URL? {
        guard let urlString = infoValue(for: .baseURL), !urlString.isEmpty else { return nil }
        return URL(string: urlString)
    }

    static var userID: String? {
        guard let userID = infoValue(for: .userID), !userID.isEmpty else { return nil }
        return userID
    }

    private static func infoValue(for key: InfoKey) -> String? {
        Bundle.main.object(forInfoDictionaryKey: key.rawValue) as? String
    }
}
