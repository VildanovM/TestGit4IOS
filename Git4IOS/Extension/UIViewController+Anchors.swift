//
//  UIViewController+Anchors.swift
//  Git4IOS
//
//  Created by Максим Вильданов on 29.11.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    func anchor(view anchoredView: UIView, useSafeAnchors: Bool = true) {
        anchoredView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11, *) {
            anchoredView.topAnchor.constraint(equalTo: useSafeAnchors ? view.safeTopAnchor : view.topAnchor).isActive = true
        } else {
            anchoredView.topAnchor.constraint(equalTo: useSafeAnchors ? view.safeTopAnchor : topLayoutGuide.bottomAnchor).isActive = true
        }
        
        anchoredView.leadingAnchor.constraint(equalTo: useSafeAnchors ? view.safeLeadingAnchor : view.leadingAnchor).isActive = true
        anchoredView.trailingAnchor.constraint(equalTo: useSafeAnchors ? view.safeTrailingAnchor : view.trailingAnchor).isActive = true
        if #available(iOS 11, *) {
            anchoredView.bottomAnchor.constraint(equalTo: useSafeAnchors ? view.safeBottomAnchor : view.bottomAnchor).isActive = true
        } else {
            anchoredView.bottomAnchor.constraint(equalTo: useSafeAnchors ? view.safeBottomAnchor : bottomLayoutGuide.topAnchor).isActive = true
        }
    }
    
    func anchor(views anchoredViews: [UIView], useSafeAnchors: Bool = true) {
        var previousAnchoredView: UIView?
        
        for anchoredView in anchoredViews {
            anchoredView.translatesAutoresizingMaskIntoConstraints = false
            
            if previousAnchoredView == nil {
                anchoredView.topAnchor.constraint(equalTo: useSafeAnchors ? view.safeTopAnchor : view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            } else {
                previousAnchoredView?.bottomAnchor.constraint(equalTo: useSafeAnchors ? anchoredView.safeTopAnchor : anchoredView.topAnchor).isActive = true
            }
            
            anchoredView.leadingAnchor.constraint(equalTo: useSafeAnchors ? view.safeLeadingAnchor : view.leadingAnchor).isActive = true
            anchoredView.trailingAnchor.constraint(equalTo: useSafeAnchors ? view.safeTrailingAnchor : view.trailingAnchor).isActive = true
            
            if anchoredViews.last! == anchoredView {
                anchoredView.bottomAnchor.constraint(equalTo: useSafeAnchors ? view.safeBottomAnchor : view.safeAreaLayoutGuide.topAnchor).isActive = true
            }
            
            previousAnchoredView = anchoredView
        }
    }
    
    func fullAnchor(view anchoredView: UIView) {
        anchoredView.translatesAutoresizingMaskIntoConstraints = false
        anchoredView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        anchoredView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        anchoredView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        anchoredView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
