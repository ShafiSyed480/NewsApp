//
//  ArticleService.swift
//  NewsApp
//
//  Created by MacBook on 01/10/24.
//

import Foundation
import Combine

protocol ArticleService {
     func request(from endpoint: ArticleAPI) -> AnyPublisher<ArticleResponse, APIError>
}

struct ArticleServiceImpl: ArticleService {

    func request(from endpoint: ArticleAPI) -> AnyPublisher<ArticleResponse, APIError> {
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        return URLSession.shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in .unknown }
            .flatMap { data, response -> AnyPublisher<ArticleResponse, APIError> in

                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: .unknown)
                            .eraseToAnyPublisher()
                }

                if (200...299).contains(response.statusCode) {
                    return Just(data)
                        .decode(type: ArticleResponse.self, decoder: jsonDecoder)
                        .mapError {_ in .decodingError}
                        .eraseToAnyPublisher()
                } else {
                    return Fail(error: .errorCode(response.statusCode))
                            .eraseToAnyPublisher()
                }
            }.eraseToAnyPublisher()
    }
}

enum APIError: Error {
    case decodingError
    case errorCode(Int)
    case unknown
}

extension APIError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .decodingError:
            return "Failed to decode the error from the service"
        case .errorCode(let code):
            return "\(code) - Something went wrong"
        case .unknown:
            return "The error is unknown"
        }
    }
}
