//
//  FirstCoordinator.swift
//  Git4IOS
//
//  Created by Максим Вильданов on 07.12.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import UIKit

final class SingInCoordinator: Coordinator {
    
    public var childCoordinators: [Coordinator] = []
    
    private unowned let navigationController:UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.isNavigationBarHidden = true
    }
    
    public func start() {
        let firstViewController : SingInViewController = SingInViewController()
        firstViewController.delegate = self
        self.navigationController.viewControllers = [firstViewController]
    }
}

extension SingInCoordinator: SingInControllerDelegate {
    
    
    func navigateToNextPage() {
        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
        tabBarCoordinator.delegate = self
        childCoordinators.append(tabBarCoordinator)
        tabBarCoordinator.start()
    }
    
    func navigateToSingUpPage() {
        let singUpCoordinator = SingUpCoordinator(navigationController: navigationController)
        singUpCoordinator.delegate = self
        childCoordinators.append(singUpCoordinator)
        singUpCoordinator.start()
    }
    
    func allertPresent(allert: UIAlertController, viewController: UIViewController) {
        viewController.present(allert, animated: true, completion: nil)
    }
    
}

extension SingInCoordinator: BackToFirstViewControllerDelegate {
    
    func navigateBackToFirstPage(newOrderCoordinator: TabBarCoordinator) {
        navigationController.popToRootViewController(animated: true)
        childCoordinators.removeLast()
    }
}

extension SingInCoordinator: BackToSingInControllerDelegate {
    func navigateBackToFirstPage(newOrderCoordinator: SingUpCoordinator) {
        navigationController.popToRootViewController(animated: true)
        childCoordinators.removeLast()
    }
}
