//
//  LogoutViewControllerTests.swift
//  Git4IOSTests
//
//  Created by Максим Вильданов on 10.12.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import XCTest
@testable import Git4IOS

class LogoutViewControllerTests: XCTestCase {
    
    func testThatLogoutViewControllerHasLogoutMessage() {
        // Arrange
        let logoutViewController = LogoutViewController()
        
        // Act
        logoutViewController.setLogoutLabel()
        
        // Assert
        XCTAssertTrue(logoutViewController.logoutLabel.text == "Already leaving? We will miss you! 😢")
    }
    
    func testThatLogoutViewControllerHasLogoutButton() {
        // Arrange
        let logoutViewController = LogoutViewController()
        
        // Act
        logoutViewController.setLogoutButton()
        
        // Assert
        XCTAssertTrue(logoutViewController.logoutButton.titleLabel?.text == "Logout")
    }
    
}
