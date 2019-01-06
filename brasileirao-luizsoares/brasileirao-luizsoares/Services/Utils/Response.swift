//
//  Response.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 06/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import Foundation
import Moya

public extension Response {
    
    public func mapObject<T: APICodable>() throws -> T {
        guard let json = try mapJSON() as? [String : Any], let object = T.decode(json) else {
            throw APIErrors.jsonMappingError
        }
        return object
    }
    
    public func mapObject<T: APICodable>(keyPath key: String?) throws -> T {
        guard let key = key else { return try mapObject() }
        guard let json = try mapJSON() as? NSDictionary,
            let objectDict = json.value(forKeyPath: key) as? [String : Any],
            let object = T.decode(objectDict) else {
                throw APIErrors.jsonMappingError
        }
        return object
    }
    
    public func mapArray<T: APICodable>() throws -> [T] {
        guard let jsonArray = try mapJSON() as? NSArray, let object = T.decode(jsonArray) else {
            throw APIErrors.jsonMappingError
        }
        return object
    }
    
    public func mapArray<T: APICodable>(keyPath key: String?) throws -> [T] {
        guard let key = key else { return try mapArray() }
        guard let json = try mapJSON() as? NSDictionary,
            let objectArray = json.value(forKeyPath: key) as? NSArray,
            let object = T.decode(objectArray) else {
                throw APIErrors.jsonMappingError
        }
        return object
    }
    
}
