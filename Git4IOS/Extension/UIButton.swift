//
//  UIButton.swift
//  Git4IOS
//
//  Created by Максим Вильданов on 05.12.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import Foundation
import UIKit

public extension UIButton {
    
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.6
        pulse.fromValue = 0.8
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        layer.add(pulse, forKey: nil)
    }
    
    
}
