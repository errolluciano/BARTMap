//
//  BartAPI.swift
//  BARTMap
//
//  Created by Erroll Luciano on 6/10/19.
//  Copyright © 2019 Erroll Luciano. All rights reserved.
//

import Foundation
import CoreData

enum Command: String {
    case depart = "depart"
    case arrive = "arrive"
    case fare = "fare"
}

struct BartAPI {
    
    private static let hostURLString = "http://api.bart.gov/api/"
    private static let pathURLString = "sched.aspx"
    private static let apiKey = "MW9S-E7SL-26DU-VV8V"
    
    private static func flickrURL(command: Command, parameters: [String: String]?) -> URL {
        
        var components = URLComponents(string: hostURLString)!
        
        var queryItems = [URLQueryItem]()
        
        let baseParams = [
            "cmd": command.rawValue,
            "key": apiKey,
            "json": "y"
        ]
        
        for (key, value) in baseParams {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        if let additionalParams = parameters {
            for (key, value) in additionalParams {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        
        components.queryItems = queryItems
        
        return components.url!
    }
}
