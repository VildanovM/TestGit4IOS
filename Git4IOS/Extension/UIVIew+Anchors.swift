//
//  UIVIew+Anchors.swift
//  Git4IOS
//
//  Created by Максим Вильданов on 29.11.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import UIKit

public extension UIView {
    var safeLeadingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.leadingAnchor
        } else {
            return leadingAnchor
        }
    }
    
    var safeTrailingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.trailingAnchor
        } else {
            return trailingAnchor
        }
    }
    
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.topAnchor
        } else {
            return topAnchor
        }
    }
    
    var safeLeftAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.leftAnchor
        } else {
            return leftAnchor
        }
    }
    
    var safeRightAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.rightAnchor
        } else {
            return rightAnchor
        }
    }
    
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.bottomAnchor
        } else {
            return bottomAnchor
        }
    }
    
    func constrain(to size: CGSize) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
    }
    
    func anchor(in view: UIView, margin: CGFloat = 0.0, useSafeAnchors: Bool = true) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: useSafeAnchors ? view.safeTopAnchor : view.topAnchor, constant: margin).isActive = true
        leadingAnchor.constraint(equalTo: useSafeAnchors ? view.safeLeadingAnchor : view.leadingAnchor, constant: margin).isActive = true
        trailingAnchor.constraint(equalTo: useSafeAnchors ? view.safeTrailingAnchor : view.trailingAnchor, constant: -margin).isActive = true
        bottomAnchor.constraint(equalTo: useSafeAnchors ? view.safeBottomAnchor : view.bottomAnchor, constant: -margin).isActive = true
    }
    
    func anchor(view anchoredView: UIView, useSafeAnchors: Bool = true) {
        anchoredView.translatesAutoresizingMaskIntoConstraints = false
        anchoredView.topAnchor.constraint(equalTo: useSafeAnchors ? safeTopAnchor : topAnchor).isActive = true
        anchoredView.leadingAnchor.constraint(equalTo: useSafeAnchors ? safeLeadingAnchor : leadingAnchor).isActive = true
        anchoredView.trailingAnchor.constraint(equalTo: useSafeAnchors ? safeTrailingAnchor : trailingAnchor).isActive = true
        anchoredView.bottomAnchor.constraint(equalTo: useSafeAnchors ? safeBottomAnchor : bottomAnchor).isActive = true
    }
    
    func center(in view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func anchor(below aboveView: UIView, spacing: CGFloat = 0.0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        topAnchor.constraint(equalTo: aboveView.bottomAnchor, constant: spacing).isActive = true
        centerXAnchor.constraint(equalTo: aboveView.centerXAnchor).isActive = true
        
        if let someSuperview = superview {
            
            leadingAnchor.constraint(greaterThanOrEqualTo: someSuperview.layoutMarginsGuide.leadingAnchor).isActive = true
            trailingAnchor.constraint(lessThanOrEqualTo: someSuperview.layoutMarginsGuide.trailingAnchor).isActive = true
            
        }
    }
    
    func anchor(views anchoredViews: [UIView]) {
        var previousAnchoredView: UIView?
        
        for anchoredView in anchoredViews {
            anchoredView.translatesAutoresizingMaskIntoConstraints = false
            
            if previousAnchoredView == nil {
                anchoredView.topAnchor.constraint(equalTo: topAnchor).isActive = true
            } else {
                previousAnchoredView?.bottomAnchor.constraint(equalTo: anchoredView.topAnchor).isActive = true
            }
            
            anchoredView.leadingAnchor.constraint(equalTo: safeLeadingAnchor).isActive = true
            anchoredView.trailingAnchor.constraint(equalTo: safeTrailingAnchor).isActive = true
            
            if anchoredViews.last! == anchoredView {
                anchoredView.bottomAnchor.constraint(equalTo: safeBottomAnchor).isActive = true
            }
            
            previousAnchoredView = anchoredView
        }
    }
}
