//
//  BrasileiraoAPI.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 06/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import Foundation
import Moya

public enum BrasileiraoAPI {
    
    // GET
    
    case rounds
    case games(round: Int)
    case gameplay(gameID: Int)
    
}

extension BrasileiraoAPI : TargetType {
    
    public var baseURL: URL {
        return URL(string: "http://private-5ee10-desafiogcom.apiary-mock.com")!
    }
    
    public var path: String {
        switch self {
        case .rounds:
            return "rounds"
        case .games(let round):
            return "games/\(round)"
        case .gameplay(let gameID):
            return "gameplay/\(gameID)"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var parameters: [String : Any]? {
        return nil
    }
    
    public var sampleData: Data {
        switch self {
        case .rounds:
            return "{\"rounds\" : 38, \"current\" : 38 }".data(using: .utf8)!
        default:
            return Data()
        }
    }
    
    public var task: Task {
        if let parameters = self.parameters {
            return .requestParameters(parameters: parameters, encoding: URLEncoding())
        } else {
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        return nil
    }
}
