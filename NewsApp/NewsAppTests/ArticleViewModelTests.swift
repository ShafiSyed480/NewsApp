//
//  ArticleViewModelTests.swift
//  NewsAppTests
//
//  Created by MacBook on 01/10/24.
//

import XCTest
@testable import NewsApp

class ArticleViewModelTests: XCTestCase {
    
    var articleViewModel: ArticleViewModel = ArticleViewModelImpl(service:ArticleServiceImpl())

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetArticles() throws {
        articleViewModel.getArticles()
        XCTAssertNotNil(articleViewModel.articles)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
