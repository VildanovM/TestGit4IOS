//
//  DetailViewControllerTests.swift
//  Git4IOSTests
//
//  Created by Максим Вильданов on 10.12.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import XCTest
@testable import Git4IOS

class DetailViewControllerTests: XCTestCase {
    
    func testThatMessageLabelHasAlphaOne() {
        
        // Arrange
        let detailViewController = DetailViewController()
        
        // Act
        detailViewController.loadView()
        
        // Assert
        XCTAssertTrue(detailViewController.descriptionRepository.alpha == 1)
        
    }
    
    func testThatButtonSetupCorrectly() {
        
        // Arrange
        let detailViewController = DetailViewController()
        
        // Act
        detailViewController.setViews()
        
        // Assert
        XCTAssertTrue(detailViewController.buttonPushToGithub.titleLabel?.text == "Go To Repository")
        
    }
    
}
