//
//  RepositoriesModel.swift
//  Git4IOS
//
//  Created by Максим Вильданов on 29.11.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import Foundation
import CoreData

struct Model: Decodable {
    
    var items : [Items]
    
}

struct Items: Decodable {
    
    var name : String?
    var full_name: String?
    var html_url: String?
    var description: String?
    var stargazers_count: Int?
    var watchers_count: Int?
    var forks_count: Int?
    
}



