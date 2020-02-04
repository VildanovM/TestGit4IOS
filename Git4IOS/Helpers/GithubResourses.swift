//
//  GithubResourses.swift
//  Git4IOS
//
//  Created by Максим Вильданов on 29.11.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import Foundation

public enum RepositoriesType: String {
    
    case swift = "Swift"
    case objectiveC = "Objective C"
    
    var githubRessourceURL: String {
        switch self {
        case .swift:
            return "https://api.github.com/search/repositories?q=swift+language:swift&sort=stars"
        case .objectiveC:
            return "https://api.github.com/search/repositories?q=ios+language:objectivec&sort=stars"
        }
    }
}


