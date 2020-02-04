//
//  ThirdCoordinator.swift
//  Git4IOS
//
//  Created by Максим Вильданов on 08.12.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import UIKit


protocol BackToSingInControllerDelegate: class {
    
    func navigateBackToFirstPage(newOrderCoordinator: SingUpCoordinator)
    
}

final class SingUpCoordinator: Coordinator {
    
    public var childCoordinators: [Coordinator] = []
    private unowned let navigationController:UINavigationController
    public weak var delegate: BackToSingInControllerDelegate?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let thirdViewController : SingUpViewController = SingUpViewController()
        thirdViewController.delegate = self
        self.navigationController.pushViewController(thirdViewController, animated: true)
    }
}

extension SingUpCoordinator : SingUpCoordinatorDelegate {
    
    func navigateToFirstPage() {
        self.delegate?.navigateBackToFirstPage(newOrderCoordinator: self)
    }
    
    func allertPresent(allert: UIAlertController, viewController: UIViewController) {
        viewController.present(allert, animated: true, completion: nil)
    }
}

