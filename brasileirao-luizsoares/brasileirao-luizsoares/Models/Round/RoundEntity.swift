//
//  RoundEntity.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 06/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import Foundation

struct RoundEntity : APICodable {
    
    let total: Int
    let current: Int
    
    enum CodingKeys: String, CodingKey {
        
        case total      = "rounds"
        case current    = "current"
        
    }
    
    static func decode(from json: [String : Any]) -> RoundEntity? {
        if let jsonData = try? JSONSerialization.data(withJSONObject: json, options: []) {
            if let decodedObject = try? JSONDecoder().decode(RoundEntity.self, from: jsonData) {
                return decodedObject
            }
        }
        return nil
    }
    
}
