//
//  RepositoriesViewCoordinator.swift
//  Git4IOS
//
//  Created by Максим Вильданов on 29.11.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import UIKit

final class RepositoriesViewCoordinator: UIViewController, UITableViewDelegate {
    
    // MARK: - Public Variables
    public var repositoriesType: RepositoriesType = .swift {
        
        didSet {
            
            title = repositoriesType.rawValue
            
        }
    }
    
    // MARK: - Private Variables
    private let repositoriesViewController = ListViewController()
    private lazy var loadingViewController = LoadingViewController(contentViewController: repositoriesViewController)
    private var jsonModel: Model?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = repositoriesType.rawValue
        repositoriesViewController.tableView.delegate = self
        
        add(asChildViewController: loadingViewController)
        
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadingViewController.startLoading()
        NetworkService.get(url: repositoriesType.githubRessourceURL) { [weak self] json in
            guard let self = self else { return }
            DispatchQueue.main.async {
                guard let json = json else { return }
                self.loadingViewController.endLoading()
                self.jsonModel = json
                self.repositoriesViewController.topItems = Array(json.items[0...2])
                self.repositoriesViewController.otherItems = Array(json.items[3...json.items.count - 1])
                self.repositoriesViewController.jsonModel = json
                
            }
        }
        
    }
    
    
    // MARK: - UITableViewDelegate
    
    public func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailViewController = DetailViewController()
        
        let detail = jsonModel?.items[indexPath.row]
        
        if let starCount = detail?.stargazers_count, let forksCount = detail?.forks_count, let watchersCount = detail?.watchers_count {
            
            detailViewController.starsCount.text = String(starCount)
            detailViewController.forksCount.text = String(forksCount)
            detailViewController.watchersCount.text = String(watchersCount)
        }
        
        detailViewController.descriptionRepository.text = detail?.description
        detailViewController.titleRepositories = detail?.full_name ?? "default repository"
        detailViewController.url = detail?.html_url ?? "https://github.com/"
        
        navigationController?.pushViewController(detailViewController, animated: true)
        
    }
    
}
