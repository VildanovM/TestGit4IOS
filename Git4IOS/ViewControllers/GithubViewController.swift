//
//  GithubViewController.swift
//  Git4IOS
//
//  Created by Максим Вильданов on 08.12.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import UIKit

final class GithubViewController: UIViewController {
    
    // MARK: - Public variables
    public let githubCatImage = UIImageView()
    public let goToGithubButton = UIButton()
    // MARK: - Private variables
    private let mainStackView = UIStackView()
    private let navigationRoot = RootRepositoriesCoordinator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setGithubCatImage()
        setGithubButton()
        setMainStackView()
        setLogoutStackViewConstraint()
        setLogoutStackViewConstraint()
    }
    
    
    public func setGithubCatImage() {
        githubCatImage.image = UIImage(named: "0ba2aa20e2c2ce80e9a2db5b07198464")
        githubCatImage.contentMode = .scaleAspectFit
        
    }
    
    
    public func setGithubButton() {
        goToGithubButton.setTitle("Go to Github", for: .normal)
        goToGithubButton.backgroundColor = .blue
        goToGithubButton.layer.cornerRadius = 10
        goToGithubButton.addTarget(self, action: #selector(pushToSingInViewController), for: .touchUpInside)
    }
    
    private func setMainStackView() {
        mainStackView.axis = .vertical
        mainStackView.distribution = .fill
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.preservesSuperviewLayoutMargins = true
        view.addSubview(mainStackView)
    }
    
    private func setLogoutStackViewConstraint() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        
        mainStackView.addArrangedSubview(githubCatImage)
        mainStackView.addArrangedSubview(goToGithubButton)
        
        
        goToGithubButton.translatesAutoresizingMaskIntoConstraints = false
        goToGithubButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        goToGithubButton.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor).isActive = true
    }
    
    @objc private func pushToSingInViewController() {
        goToGithubButton.pulsate()
        UIView.animate(withDuration: 0.3) { 
            self.goToGithubButton.backgroundColor = .gray
            self.goToGithubButton.backgroundColor = .blue
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) { [weak self] in
            guard let self = self else { return }
            self.navigationRoot.goToRepository(url: "https://github.com", viewController: self)
        }
        
    }
    
    
}
