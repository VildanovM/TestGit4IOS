//
//  SecondCoordinator.swift
//  Git4IOS
//
//  Created by Максим Вильданов on 07.12.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import UIKit


protocol BackToFirstViewControllerDelegate: class {
    
    func navigateBackToFirstPage(newOrderCoordinator: TabBarCoordinator)
    
}

final class TabBarCoordinator: Coordinator {
    
    public var childCoordinators: [Coordinator] = []
    private unowned let navigationController:UINavigationController
    public weak var delegate: BackToFirstViewControllerDelegate?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let secondViewController : RootRepositoriesCoordinator = RootRepositoriesCoordinator()
        secondViewController.delegate = self
        self.navigationController.pushViewController(secondViewController, animated: true)
    }
}

extension TabBarCoordinator : TabBarCoordinatorDelegate {
    
    func navigateToThirdPage() {
        let thirdViewController : LogoutViewController = LogoutViewController()
        thirdViewController.delegate = self
        self.navigationController.pushViewController(thirdViewController, animated: true)
    }
    
    func navigateToFirstPage() {
        self.delegate?.navigateBackToFirstPage(newOrderCoordinator: self)
    }
}


