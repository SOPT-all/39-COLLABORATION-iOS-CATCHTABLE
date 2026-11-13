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
    case networkConnection
    case timeout
    case transportFailed(Error)
    case invalidResponse
    case decodingFailed(Error)
    case emptyData
    case server(statusCode: Int, code: APIErrorCode, message: String)
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidBaseURL:
            return "서버 주소가 설정되지 않았어요."
        case .invalidURL:
            return "요청 주소가 올바르지 않아요."
        case .encodingFailed:
            return "요청 데이터를 변환하지 못했어요."
        case .networkConnection:
            return "네트워크에 연결할 수 없어요. 연결 상태를 확인해주세요."
        case .timeout:
            return "요청 시간이 초과되었어요. 잠시 후 다시 시도해주세요."
        case .transportFailed:
            return "알 수 없는 오류가 발생했어요."
        case .invalidResponse:
            return "올바른 응답을 받지 못했어요."
        case .decodingFailed:
            return "서버 응답을 해석하지 못했어요."
        case .emptyData:
            return "서버 응답에 데이터가 없어요."
        case .server(_, _, let message):
            return message.isEmpty ? "서버 오류가 발생했어요. 잠시 후 다시 시도해주세요." : message
        }
    }
}
