//
//  SignInViewControllerTests.swift
//  Git4IOSTests
//
//  Created by Максим Вильданов on 10.12.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import XCTest
@testable import Git4IOS


class SignInViewControllerTests: XCTestCase {
    
    
    func testThatSignInViewControllerHasSignInMessage() {
        // Arrange
        let signInViewController = SingInViewController()
        
        // Act
        signInViewController.setLoginMessageLabel()
        
        // Assert
        XCTAssertTrue(signInViewController.loginMessageLabel.text == "Login with Email Address")
    }
    
    func testThatSignInViewControllerHasSignInButton() {
        // Arrange
        let signInViewController = SingInViewController()
        
        // Act
        signInViewController.setButtons()
        
        // Assert
        XCTAssertTrue(signInViewController.singInButton.titleLabel?.text == "Sing In")
    }
    
    func testThatSignInViewControllerHasSignUpButton() {
        // Arrange
        let signInViewController = SingInViewController()
        
        // Act
        signInViewController.setButtons()
        
        // Assert
        XCTAssertTrue(signInViewController.singUpButton.titleLabel?.text == "Sing Up")
    }
    
    func testThatSignInViewControllerHasEmailPlaceholder() {
        // Arrange
        let signInViewController = SingInViewController()
        
        // Act
        signInViewController.setEmailAndPassword()
        
        // Assert
        XCTAssertTrue(signInViewController.emailTextField.placeholder == "email")
    }
    
    func testThatSignInViewControllerHasPasswordPlaceholder() {
        // Arrange
        let signInViewController = SingInViewController()
        
        // Act
        signInViewController.setEmailAndPassword()
        
        // Assert
        XCTAssertTrue(signInViewController.passwordTextField.placeholder == "password")
    }
    
    
}
