//
//  NetworkServiceTests.swift
//  Git4IOSTests
//
//  Created by Максим Вильданов on 10.12.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import XCTest
@testable import Git4IOS

class NetworkServiceTests: XCTestCase {
    
    func testThatNetworkServiceMakeRequest() {
        // Arrange
        let expectation = XCTestExpectation(description: "Download github Swift repositories")
        let someUrl = "https://api.github.com/search/repositories?q=swift+language:swift&sort=stars"
        
        // Act
        NetworkService.get(url: someUrl) { (result) in
            // Assert
            XCTAssertNotNil(result)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
        
    }
    
    func testThatNetworkServiceMakeRequestWithInvalidUrl() {
        // Arrange
        let expectation = XCTestExpectation(description: "Download github Swift repositories")
        let someUrl = "https://api.github.com/"
        
        // Act
        NetworkService.get(url: someUrl) { (result) in
            // Assert
            XCTAssertNil(result)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
}
