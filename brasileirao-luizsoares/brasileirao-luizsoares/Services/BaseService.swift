//
//  BaseService.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 06/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import Foundation
import Moya

protocol BaseService {
    
    func handleResponseObject<T: APICodable>(response: Moya.Response, key: String?) throws -> T
    func handleResponseArray<T: APICodable>(response: Moya.Response, key: String?) throws -> [T]
    
    func handleResponseError(response: Moya.Response) -> APIError
    
    func handleFailure(failure: Moya.MoyaError) -> APIError
    
}

extension BaseService {
    
    func handleResponseObject<T: APICodable>(response: Moya.Response, key: String? = nil) throws -> T {
        if response.statusCode == 200 {
            do {
                let obj: T = try response.mapObject()
                return obj
            } catch {
                throw APIErrors.jsonMappingError
            }
        } else {
            let error = self.handleResponseError(response: response)
            throw APIErrors.undefined(description: error["message"]!)
        }
    }
    
    func handleResponseArray<T: APICodable>(response: Moya.Response, key: String? = nil) throws -> [T] {
        if response.statusCode == 200 {
            do {
                let obj: [T] = try response.mapArray()
                return obj
            } catch {
                throw APIErrors.jsonMappingError
            }
        } else {
            let error = self.handleResponseError(response: response)
            throw APIErrors.undefined(description: error["message"]!)
        }
    }
    
    func handleResponseError(response: Moya.Response) -> APIError {
        return ["code" : "-1", "message" : "Ocorreu um error. Por favor, tente novamente"]
    }
    
    func handleFailure(failure: Moya.MoyaError) -> APIError {
        switch failure {
        case .jsonMapping(_):
            return APIErrors.jsonMappingError.message()
        case .requestMapping(let error):
            return APIErrors.undefined(description: error).message()
        default:
            return ["code" : "-1", "message" : "Ocorreu um error. Por favor, tente novamente"]
        }
    }
    
}
