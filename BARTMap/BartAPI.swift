//
//  BartAPI.swift
//  BARTMap
//
//  Created by Erroll Luciano on 6/10/19.
//  Copyright © 2019 Erroll Luciano. All rights reserved.
//

import Foundation
import CoreData

enum Method: String{
    case depart = "depart"
    case arrive = "arrive"
    case fare = "fare"
}

struct BartAPI {
    
    private static let baseURLString = "http://api.bart.gov/api/sched.aspx"
    private static let apiKey = "MW9S-E7SL-26DU-VV8V"
    
    private static func flickrURL(method: Method, parameters: [String: String]?) -> URL {
        
        var components = URLComponents(string: baseURLString)!
        
        var queryItems = [URLQueryItem]()
        
        let baseParams = [
            "cmd": method.rawValue,
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
