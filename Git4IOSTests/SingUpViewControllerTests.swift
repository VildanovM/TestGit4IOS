//
//  SingUpViewControllerTests.swift
//  Git4IOSTests
//
//  Created by Максим Вильданов on 10.12.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import XCTest
@testable import Git4IOS

class SingUpViewControllerTests: XCTestCase {
    
    
    func testThatSignUpViewControllerHasSignUpMessage() {
        // Arrange
        let signUpViewController = SingUpViewController()
        
        // Act
        signUpViewController.setRegistrationMessageLabel()
        
        // Assert
        XCTAssertTrue(signUpViewController.loginMessageLabel.text == "Account Registration")
    }
    
    func testThatSignUpViewControllerHasSignUpButton() {
        // Arrange
        let signUpViewController = SingUpViewController()
        
        // Act
        signUpViewController.setButtons()
        
        // Assert
        XCTAssertTrue(signUpViewController.singUpButton.titleLabel?.text == "Sing Up")
    }
    
    func testThatSignUpViewControllerHasEmailPlaceholder() {
        // Arrange
        let signUpViewController = SingUpViewController()
        
        // Act
        signUpViewController.setEmailAndPassword()
        
        // Assert
        XCTAssertTrue(signUpViewController.emailTextField.placeholder == "email")
    }
    
    func testThatSignUpViewControllerHasPasswordPlaceholder() {
        // Arrange
        let signUpViewController = SingUpViewController()
        
        // Act
        signUpViewController.setEmailAndPassword()
        
        // Assert
        XCTAssertTrue(signUpViewController.passwordTextField.placeholder == "password")
    }
    
    func testThatSignUpViewControllerHasConfirmPasswordPlaceholder() {
        // Arrange
        let signUpViewController = SingUpViewController()
        
        // Act
        signUpViewController.setEmailAndPassword()
        
        // Assert
        XCTAssertTrue(signUpViewController.confirmPasswordTextField.placeholder == "confirm password")
    }
    
    func testThatSignUpViewControllerHasPrivacyPolicy() {
        // Arrange
        let signUpViewController = SingUpViewController()
        
        // Act
        signUpViewController.setRegistrationMessageLabel()
        
        // Assert
        XCTAssertTrue(signUpViewController.privacyPolicyLabel.text == "By signing up, you agree to the Privacy Policy")
    }
    
    func testThatSignInViewControllerValidateFieldsWorkingInCorrectData() {
        // Arrange
        let signUpViewController = SingUpViewController()
        
        // Act
        signUpViewController.emailTextField.text = "test12@mail.ru"
        signUpViewController.passwordTextField.text = "1234567@as"
        signUpViewController.confirmPasswordTextField.text = "1234567@as"
        let result = signUpViewController.validateFields()
        
        // Assert
        XCTAssertNil(result)
    }
    
    func testThatSignInViewControllerValidateFieldsWorkingInEmptyData() {
        // Arrange
        let signUpViewController = SingUpViewController()
        
        // Act
        signUpViewController.emailTextField.text = "test12@mail.ru"
        signUpViewController.passwordTextField.text = "1234567@as"
        let result = signUpViewController.validateFields()
        
        // Assert
        XCTAssertNotNil(result)
    }
    
    func testThatSignInViewControllerValidateFieldsWorkingInInvalidPassword() {
        // Arrange
        let signUpViewController = SingUpViewController()
        
        // Act
        signUpViewController.emailTextField.text = "test12@mail.ru"
        signUpViewController.passwordTextField.text = "1s"
        signUpViewController.confirmPasswordTextField.text = "1s"
        let result = signUpViewController.validateFields()
        
        // Assert
        XCTAssertNotNil(result)
    }
    
    func testThatSignInViewControllerValidateFieldsWorkingInInvalidConfirmPassword() {
        // Arrange
        let signUpViewController = SingUpViewController()
        
        // Act
        signUpViewController.emailTextField.text = "test12@mail.ru"
        signUpViewController.passwordTextField.text = "1234567@as"
        signUpViewController.confirmPasswordTextField.text = "12sasdsa7@as"
        let result = signUpViewController.validateFields()
        
        // Assert
        XCTAssertNotNil(result)
    }
    
    
}
