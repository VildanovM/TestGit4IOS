//
//  DetailViewController.swift
//  Git4IOS
//
//  Created by Максим Вильданов on 29.11.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {
    
    // MARK: - Public variables
    public var descriptionRepository = UILabel()
    public var buttonPushToGithub = UIButton()
    public var starsCount = UILabel()
    public var watchersCount = UILabel()
    public var forksCount = UILabel()
    public var titleRepositories = ""
    public var url = ""
    
    // MARK: - Private variables
    private let stackView = UIStackView()
    private let starsStackView = UIStackView()
    private let forksStackView = UIStackView()
    private let watchersStackView = UIStackView()
    private let infoStackView = UIStackView()
    private let imageStars = UIImageView()
    private let imageForks = UIImageView()
    private let imageWatchers = UIImageView()
    private let navigationRoot = RootRepositoriesCoordinator()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setStackView()
        setInfoStackView()
        setButtonOnStack()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        descriptionRepository.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            self.descriptionRepository.alpha = 1
        })
    }
    
    
    public func setViews() {
        
        view.backgroundColor = .white
        self.title = titleRepositories
        
        buttonPushToGithub.setTitle("Go To Repository", for: .normal)
        buttonPushToGithub.backgroundColor = .blue
        buttonPushToGithub.layer.cornerRadius = 10
        buttonPushToGithub.addTarget(self, action: #selector(goToRepository), for: .touchUpInside)
        
        descriptionRepository.numberOfLines = 0
        descriptionRepository.font = UIFont.systemFont(ofSize: 20)
        descriptionRepository.textAlignment = .center
        
        imageForks.image = UIImage(named: "git_fork-512")
        imageStars.image = UIImage(named: "star")
        imageWatchers.image = UIImage(named: "watch")
        
    }
    
    private func setStackView() {
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.preservesSuperviewLayoutMargins = true
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        
        stackView.addArrangedSubview(descriptionRepository)
        
    }
    
    
    private func setInfoStackView() {
        
        infoStackView.axis = .horizontal
        infoStackView.distribution = .fillEqually
        
        
        starsStackView.axis = .horizontal
        starsStackView.distribution = .fillEqually
        starsStackView.isLayoutMarginsRelativeArrangement = true
        starsStackView.preservesSuperviewLayoutMargins = true
        starsStackView.addArrangedSubview(imageStars)
        starsStackView.addArrangedSubview(starsCount)
        
        forksStackView.axis = .horizontal
        forksStackView.distribution = .fillEqually
        forksStackView.isLayoutMarginsRelativeArrangement = true
        forksStackView.preservesSuperviewLayoutMargins = true
        forksStackView.addArrangedSubview(imageForks)
        forksStackView.addArrangedSubview(forksCount)
        
        watchersStackView.axis = .horizontal
        watchersStackView.distribution = .fillEqually
        watchersStackView.isLayoutMarginsRelativeArrangement = true
        watchersStackView.preservesSuperviewLayoutMargins = true
        watchersStackView.addArrangedSubview(imageWatchers)
        watchersStackView.addArrangedSubview(watchersCount)
        
        infoStackView.addArrangedSubview(starsStackView)
        infoStackView.addArrangedSubview(forksStackView)
        infoStackView.addArrangedSubview(watchersStackView)
        
        stackView.addArrangedSubview(infoStackView)
        stackView.addArrangedSubview(buttonPushToGithub)
        
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.heightAnchor.constraint(lessThanOrEqualTo: stackView.heightAnchor, multiplier: 0.1).isActive = true
        
        
    }
    
    private func setButtonOnStack() {
        buttonPushToGithub.translatesAutoresizingMaskIntoConstraints = false
        buttonPushToGithub.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.1).isActive = true
        
    }
    
    
    @objc private func goToRepository() {
        
        buttonPushToGithub.pulsate()
        UIView.animate(withDuration: 0.3) { 
            self.buttonPushToGithub.backgroundColor = .gray
            self.buttonPushToGithub.backgroundColor = .blue
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            guard let self = self else { return }
            self.navigationRoot.goToRepository(url: self.url, viewController: self)
        }
        
    }
    
}
