//
//  UIViewController+Container.swift
//  Git4IOS
//
//  Created by Максим Вильданов on 29.11.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    func add(asChildViewController viewController: UIViewController, anchored: Bool = true, subview: UIView? = nil) {
        let someView: UIView = subview ?? view
        
        someView.addSubview(viewController.view)
        
        addChild(viewController)
        
        if anchored {
            someView.anchor(view: viewController.view, useSafeAnchors: false)
        }
        
        
        viewController.didMove(toParent: self)
    }
    
    func remove(viewControllerToRemove: UIViewController?) {
        guard let viewController = viewControllerToRemove else {
            return
        }
        
        viewController.willMove(toParent: nil)
        
        
        viewController.view.removeFromSuperview()
        
        
        viewController.removeFromParent()
    }
}
