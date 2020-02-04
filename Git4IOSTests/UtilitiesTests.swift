//
//  UtilitiesTests.swift
//  Git4IOSTests
//
//  Created by Максим Вильданов on 10.12.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import XCTest
@testable import Git4IOS

class UtilitiesTests: XCTestCase {
    
    func testThatIsValidPasswordWorkedCorrectly() {
        // Arrange
        let somePassword = "123456task@"
        let result: Bool?
        
        // Act
        result = Utilities.isPasswordValid(somePassword)
        
        // Assert
        XCTAssertTrue(result ?? false)
    }
    
}
