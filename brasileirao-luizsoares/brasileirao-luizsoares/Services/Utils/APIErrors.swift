//
//  APIErrors.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 06/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import Foundation

enum APIErrors: Error {
    
    case jsonMappingError
    case undefined(description: String)
    
    func message() -> APIError {
        switch self {
        case .jsonMappingError:
            return ["code" : "-1", "message" : "Não foi possível mapear o JSON"]
        case .undefined(let description):
            return ["code" : "-1", "message" : description]
        }
    }
    
}
