//
//  MockArticleService.swift
//  NewsAppTests
//
//  Created by MacBook on 02/10/24.
//

import Foundation
import Combine
@testable import NewsApp

struct MockArticleServiceImpl: ArticleService {
    func request(from endpoint: ArticleAPI) -> AnyPublisher<ArticleResponse, APIError> {
        let url = Bundle.main.url(forResource: "Stub", withExtension: "json")
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        do {
              let data = try Data(contentsOf: url!)
//            let response = try jsonDecoder.decode(ArticleResponse.self, from: data)
            return Just(data)
                     .decode(type: ArticleResponse.self, decoder: jsonDecoder)
                     .mapError {_ in .decodingError}
                     .eraseToAnyPublisher()
                  
            } catch {
              print(error.localizedDescription)
                return Fail(error: .errorCode(501))
                         .eraseToAnyPublisher()
            }
    }
}
    
