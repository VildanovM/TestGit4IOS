//
//  NetworkService.swift
//  Git4IOS
//
//  Created by Максим Вильданов on 03.12.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import Foundation

final class NetworkService {
    
    public static func get(url: String, _ complition: @escaping (Model?) -> ()) {
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        
        let url = URL(string: url)
        if let url = url {
            let urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
            
            let task1 = session.dataTask(with: urlRequest, completionHandler: {(data, response, error)
                in
                do {
                    if let data = data {
                        let posts = try JSONDecoder().decode(Model.self, from: data)
                        complition(posts)
                    }
                    
                } catch {
                    complition(nil)
                    print(error)
                }
            })
            task1.resume()
        }
        
    }
    
}

