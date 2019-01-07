//
//  APICodable.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 06/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import Foundation

public protocol APICodable : Codable {
    
    static func decode(_ json: [String : Any]) -> Self?
    //init(_ json: [String : Any]) throws
    
}

public extension APICodable {
    
    public static func decode(_ json: [String : Any]) -> Self? {
        if let jsonData = try? JSONSerialization.data(withJSONObject: json, options: []) {
            if let decodedObject = try? JSONDecoder().decode(self, from: jsonData) {
                return decodedObject
            }
        }
        return nil
    }
    
    public static func decode(_ json: NSArray) -> [Self]? {
        if let array = json as? [[String : Any]] {
            return array.map { self.decode($0)! }
        }
        return nil
    }
    
}
