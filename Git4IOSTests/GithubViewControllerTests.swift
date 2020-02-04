//
//  GithubViewControllerTests.swift
//  Git4IOSTests
//
//  Created by Максим Вильданов on 10.12.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import XCTest
@testable import Git4IOS

class GithubViewControllerTests: XCTestCase {
    
    func testThatButtonHasCorrectTitle() {
        // Arrange
        let githubViewController = GithubViewController()
        
        // Act
        githubViewController.setGithubButton()
        
        // Assert
        XCTAssertTrue(githubViewController.goToGithubButton.titleLabel?.text == "Go to Github")
        
    }
    
    
}
