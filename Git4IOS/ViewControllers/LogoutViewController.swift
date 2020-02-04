//
//  LogoutViewController.swift
//  Git4IOS
//
//  Created by Максим Вильданов on 30.11.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import UIKit
import FirebaseAuth

final class LogoutViewController: UIViewController {
    
    // MARK: - Public variables
    public weak var delegate: TabBarCoordinatorDelegate?
    public let logoutButton = UIButton()
    public let logoutLabel = UILabel()
    // MARK: - Private variables
    private let logoutStackView = UIStackView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Logout"
        setLogoutLabel()
        setLogoutButton()
        setLogoutStackView()
        setLogoutStackViewConstraint()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        logoutLabel.alpha = 0
        UIView.animate(withDuration: 1, animations: { [weak self] in
            guard let self = self else {return}
            self.logoutLabel.alpha = 1
        })
        navigationController?.isNavigationBarHidden = false
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    public func setLogoutLabel() {
        logoutLabel.text = "Already leaving? We will miss you! 😢"
        logoutLabel.numberOfLines = 0
        logoutLabel.font = UIFont.boldSystemFont(ofSize: 30)
    }
    
    
    public func setLogoutButton() {
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.backgroundColor = .blue
        logoutButton.layer.cornerRadius = 10
        logoutButton.addTarget(self, action: #selector(pushToSingInViewController), for: .touchUpInside)
    }
    
    private func setLogoutStackView() {
        logoutStackView.axis = .vertical
        logoutStackView.distribution = .fill
        logoutStackView.isLayoutMarginsRelativeArrangement = true
        logoutStackView.preservesSuperviewLayoutMargins = true
        view.addSubview(logoutStackView)
    }
    
    private func setLogoutStackViewConstraint() {
        logoutStackView.translatesAutoresizingMaskIntoConstraints = false
        logoutStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        logoutStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200).isActive = true
        logoutStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        logoutStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        logoutStackView.addArrangedSubview(logoutLabel)
        logoutStackView.addArrangedSubview(logoutButton)
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        logoutButton.bottomAnchor.constraint(equalTo: logoutStackView.bottomAnchor).isActive = true
        
    }
    
    private func createAlertInvalidLogout(messageText: String) {
        
        let alertController = UIAlertController(title: "Error", message: messageText, preferredStyle: .alert)
        
        let allertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(allertAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    @objc private func pushToSingInViewController() {
        logoutButton.pulsate()
        UIView.animate(withDuration: 0.3) { 
            self.logoutButton.backgroundColor = .gray
            self.logoutButton.backgroundColor = .blue
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            [weak self] in
            guard let self = self else { return }
            do {
                try Auth.auth().signOut()
            } catch let logoutError {
                self.createAlertInvalidLogout(messageText: logoutError.localizedDescription)
            }
            self.delegate?.navigateToFirstPage()
        }
        
    }
    
}
