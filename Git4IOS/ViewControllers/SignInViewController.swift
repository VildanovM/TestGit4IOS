//
//  SingInViewController.swift
//  Git4IOS
//
//  Created by Максим Вильданов on 07.12.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import UIKit
import FirebaseAuth

public protocol SingInControllerDelegate: class {
    func navigateToNextPage()
    func navigateToSingUpPage()
    func allertPresent(allert: UIAlertController, viewController: UIViewController)
}

final class SingInViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Public variables
    public weak var delegate: SingInControllerDelegate?
    public let loginMessageLabel = UILabel()
    public let emailTextField = UITextField()
    public let passwordTextField = UITextField()
    public let singInButton = UIButton()
    public let singUpButton = UIButton()
    // MARK: - Private variables
    private let mainStackView = UIStackView()
    private let emailAndPasswordStackView = UIStackView()
    private let rootNavigation = RootRepositoriesCoordinator()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        setMainStackView()
        setEmailAndPassword()
        setEmailStackView()
        setButtons()
        setLoginMessageLabel()
        setConstraintsAndAddSubview()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        emailTextField.text = ""
        passwordTextField.text = ""
        if (Auth.auth().currentUser?.uid) != nil  {
            self.delegate?.navigateToNextPage()
        }
        
        
        loginMessageLabel.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            self.loginMessageLabel.alpha = 1
        })
        navigationController?.isNavigationBarHidden = true
    }
    
    public func setButtons() {
        
        singInButton.setTitle("Sign In", for: .normal)
        singInButton.backgroundColor = .blue
        singInButton.layer.cornerRadius = 10
        singInButton.addTarget(self, action: #selector(singInAction), for: .touchUpInside)
        
        singUpButton.setTitle("Sign Up", for: .normal)
        singUpButton.setTitleColor(.blue, for: .normal)
        singUpButton.addTarget(self, action: #selector(singUpAction), for: .touchUpInside)
        
    }
    
    // MARK: - Private function
    public func setLoginMessageLabel() {
        
        loginMessageLabel.text = "Login with Email Address"
        loginMessageLabel.numberOfLines = 0
        loginMessageLabel.font = UIFont.boldSystemFont(ofSize: 30)
        
    }
    
    public func setEmailAndPassword() {
        
        emailTextField.placeholder = "email"
        passwordTextField.placeholder = "password"
        emailTextField.borderStyle = .bezel
        passwordTextField.borderStyle = .bezel
        passwordTextField.isSecureTextEntry = true
        
        emailTextField.autocorrectionType = .no
        passwordTextField.autocorrectionType = .no
        
    }
    
    // MARK: - Private function
    private func setMainStackView() {
        
        mainStackView.axis = .vertical
        mainStackView.distribution = .equalSpacing
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.preservesSuperviewLayoutMargins = true
        view.addSubview(mainStackView)
        
    }
    
    private func setEmailStackView() {
        
        emailAndPasswordStackView.axis = .vertical
        emailAndPasswordStackView.spacing = 5
        emailAndPasswordStackView.distribution = .fillEqually
        
        emailAndPasswordStackView.addArrangedSubview(emailTextField)
        emailAndPasswordStackView.addArrangedSubview(passwordTextField)
        
    }
    
    
    private func setConstraintsAndAddSubview() {
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        
        mainStackView.addArrangedSubview(loginMessageLabel)
        mainStackView.addArrangedSubview(emailAndPasswordStackView)
        mainStackView.addArrangedSubview(singInButton)
        mainStackView.addArrangedSubview(singUpButton)
        
    }
    
    private func singInUser() {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email.trimmingCharacters(in: .whitespacesAndNewlines), password: password.trimmingCharacters(in: .whitespacesAndNewlines)) { [weak self] (result, error) in
                guard let self = self else { return }
                if let error = error {
                    self.createAlertInvalidLoginOrPassword(messageText: error.localizedDescription)
                } else {
                    self.delegate?.navigateToNextPage()
                }
            }
        }
    }
    
    private func createAlertInvalidLoginOrPassword(messageText: String) {
        
        let alertController = UIAlertController(title: "Error", message: messageText, preferredStyle: .alert)
        
        let allertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(allertAction)
        self.delegate?.allertPresent(allert: alertController, viewController: self)
        
    }
    
    @objc private func singInAction() {
        [emailTextField, passwordTextField].forEach {
            $0.resignFirstResponder()
        }
        singInButton.pulsate()
        UIView.animate(withDuration: 0.3) {
            self.singInButton.backgroundColor = .gray
            self.singInButton.backgroundColor = .blue
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            guard let self = self else { return }
            self.singInUser()
        }
    }
    
    @objc private func singUpAction() {
        self.delegate?.navigateToSingUpPage()
    }
    
    // MARK: - TextFieldDelegate 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
        
    }
    
}
