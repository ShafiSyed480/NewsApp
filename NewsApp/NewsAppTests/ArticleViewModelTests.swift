//
//  ArticleViewModelTests.swift
//  NewsAppTests
//
//  Created by MacBook on 01/10/24.
//

import XCTest
@testable import NewsApp

class ArticleViewModelTests: XCTestCase {
    
    var sut: ArticleViewModel = ArticleViewModelImpl(service:MockArticleServiceImpl())

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetArticles() throws {
        //Given
        
        //When
        sut.getArticles()
        
        //Then
        XCTAssertNotNil(sut.articles)
        XCTAssertEqual(sut.articles.count, 12)
    }

}
