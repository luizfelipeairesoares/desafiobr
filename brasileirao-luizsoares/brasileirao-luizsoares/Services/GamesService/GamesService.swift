//
//  GamesService.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 06/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import Foundation
import Moya

struct GamesService : BaseService {
    
    private let provider: MoyaProvider<BrasileiraoAPI> = MoyaProvider<BrasileiraoAPI>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    // MARK: - Requests
    
    internal func requestRounds(completionHandler: @escaping (APIResult<RoundEntity, APIError>) -> Void) {
        self.provider.request(.rounds) { (result) in
            switch result {
            case .success(let response):
                do {
                    let obj: RoundEntity = try self.handleResponseObject(response: response) as RoundEntity
                    completionHandler(APIResult.success(obj))
                } catch {
                    completionHandler(APIResult.failure(APIErrors.jsonMappingError.message()))
                }
            case .failure(let failure):
                completionHandler(APIResult.failure(self.handleFailure(failure: failure)))
            }
        }
    }
    
    //internal func requestGames(round: Int, completionHandler: @escaping ()
    
}
