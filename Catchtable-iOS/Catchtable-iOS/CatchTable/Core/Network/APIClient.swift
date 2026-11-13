//
//  APIClient.swift
//  Catchtable-iOS
//
//  Created by h2e on 11/13/26.
//

import Foundation

protocol APIClientProtocol {
    func request<Response: Decodable>(_ endpoint: some Endpoint) async throws -> Response
    func request(_ endpoint: some Endpoint) async throws
}

final class APIClient {
    private let session: URLSession
    private let baseURL: URL?
    private let userID: String?
    private let decoder = JSONDecoder()

    init(
        session: URLSession = .shared,
        baseURL: URL? = APIConfig.baseURL,
        userID: String? = APIConfig.userID
    ) {
        self.session = session
        self.baseURL = baseURL
        self.userID = userID
    }

    private var defaultHeaders: [String: String] {
        var headers = [HTTPHeaderField.accept.rawValue: ContentType.json.rawValue]
        if let userID {
            headers[HTTPHeaderField.userID.rawValue] = userID
        }
        return headers
    }

    private func send<Response: Decodable>(
        _ endpoint: some Endpoint
    ) async throws -> BaseResponse<Response> {
        guard let baseURL else { throw NetworkError.invalidBaseURL }

        let request = try endpoint.makeURLRequest(baseURL: baseURL, headers: defaultHeaders)
        let (data, response) = try await perform(request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        return try decode(data, httpResponse: httpResponse)
    }

    private func perform(_ request: URLRequest) async throws -> (Data, URLResponse) {
        do {
            return try await session.data(for: request)
        } catch let error as URLError {
            switch error.code {
            case .notConnectedToInternet, .networkConnectionLost:
                throw NetworkError.networkConnection
            case .timedOut:
                throw NetworkError.timeout
            case .cancelled:
                throw CancellationError()
            default:
                throw NetworkError.transportFailed(error)
            }
        }
    }

    private func decode<Response: Decodable>(
        _ data: Data,
        httpResponse: HTTPURLResponse
    ) throws -> BaseResponse<Response> {
        let baseResponse: BaseResponse<Response>
        do {
            baseResponse = try decoder.decode(BaseResponse<Response>.self, from: data)
        } catch {
            guard httpResponse.isSuccess else {
                throw NetworkError.server(
                    statusCode: httpResponse.statusCode,
                    code: .unknown,
                    message: ""
                )
            }
            throw NetworkError.decodingFailed(error)
        }

        guard httpResponse.isSuccess, baseResponse.success else {
            throw NetworkError.server(
                statusCode: httpResponse.statusCode,
                code: APIErrorCode(code: baseResponse.code),
                message: baseResponse.message
            )
        }

        return baseResponse
    }
}

extension APIClient: APIClientProtocol {
    func request<Response: Decodable>(_ endpoint: some Endpoint) async throws -> Response {
        let response: BaseResponse<Response> = try await send(endpoint)
        guard let data = response.data else { throw NetworkError.emptyData }
        return data
    }

    func request(_ endpoint: some Endpoint) async throws {
        let _: BaseResponse<EmptyData> = try await send(endpoint)
    }
}

private extension HTTPURLResponse {
    var isSuccess: Bool {
        (200..<300).contains(statusCode)
    }
}
