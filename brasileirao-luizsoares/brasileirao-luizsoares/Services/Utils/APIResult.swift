//
//  APIResult.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 06/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import Foundation

typealias APIError = [String : String]

enum APIResult<T, E> {
    case success(T)
    case failure(APIError)
}
