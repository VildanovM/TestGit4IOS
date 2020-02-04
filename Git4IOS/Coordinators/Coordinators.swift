//
//  Coordinators.swift
//  Git4IOS
//
//  Created by Максим Вильданов on 07.12.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import UIKit

public protocol Coordinator : class {
    
    var childCoordinators: [Coordinator] { get set }
    
    
    init(navigationController:UINavigationController)
    
    func start()
}
