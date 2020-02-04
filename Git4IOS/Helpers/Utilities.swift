//
//  Utilities.swift
//  Git4IOS
//
//  Created by Максим Вильданов on 09.12.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import Foundation
import UIKit

final class Utilities {
    
    public static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
}
