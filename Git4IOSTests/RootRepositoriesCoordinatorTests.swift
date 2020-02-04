//
//  RootRepositoriesCoordinatorTests.swift
//  Git4IOSTests
//
//  Created by Максим Вильданов on 10.12.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import XCTest
@testable import Git4IOS

class RootRepositoriesCoordinatorTests: XCTestCase {
    
    func testThatSafariServicesWorkedCorrectly() {
        // Arrange
        let someUrl = "https://www.google.com"
        let someViewController = UIViewController()
        let rootNavigator = RootRepositoriesCoordinator()
        
        // Act
        someViewController.loadViewIfNeeded()
        rootNavigator.goToRepository(url: someUrl, viewController: someViewController)
        
        // Assert
        XCTAssertTrue(!someViewController.isBeingDismissed)
    }
    
}
