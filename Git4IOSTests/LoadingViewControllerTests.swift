//
//  LoadingViewControllerTests.swift
//  Git4IOSTests
//
//  Created by Максим Вильданов on 10.12.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import XCTest
@testable import Git4IOS

class LoadingViewControllerTests: XCTestCase {
    
    func testThatLoadingIsEnded() {
        // Arrange
        let someViewController = UIViewController()
        let loadingViewController = LoadingViewController(contentViewController: someViewController)
        
        // Act
        loadingViewController.startLoading()
        loadingViewController.endLoading()
        
        // Assert
        XCTAssertFalse(someViewController.view.isHidden)
        
    }
    
}
