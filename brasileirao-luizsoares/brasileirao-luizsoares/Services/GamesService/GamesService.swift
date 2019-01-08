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
        let round = PersistenceManager.sharedInstance.fetch(RoundCoreDataEntity.self)
        if round.count > 0 && Reachability.sharedInstance.isConnected() == false {
            let coredataround = round.first!
            let round = RoundConverter.convertToEntity(coredata: coredataround)
            completionHandler(APIResult.success(round))
        } else if Reachability.sharedInstance.isConnected() == true {
            self.provider.request(.rounds) { (result) in
                switch result {
                case .success(let response):
                    do {
                        let obj: RoundEntity = try self.handleResponseObject(response: response) as RoundEntity
                        _ = RoundConverter.convertToCoreData(entity: obj)
                        if round.count > 0 {
                            PersistenceManager.sharedInstance.delete(round.first!)
                        }
                        PersistenceManager.sharedInstance.save()
                        completionHandler(APIResult.success(obj))
                    } catch {
                        completionHandler(APIResult.failure(APIErrors.jsonMappingError.message()))
                    }
                case .failure(let failure):
                    completionHandler(APIResult.failure(self.handleFailure(failure: failure)))
                }
            }
        } else {
            completionHandler(APIResult.failure(APIErrors.networkUnreachable.message()))
        }
    }
    
    internal func requestGames(round: Int, completionHandler: @escaping (APIResult<[GameEntity], APIError>) -> Void) {
        let coredataGames = PersistenceManager.sharedInstance.fetch(GameCoreDataEntity.self)
        if Reachability.sharedInstance.isConnected() {
            self.provider.request(.games(round: round)) { (result) in
                switch result {
                case .success(let response):
                    do {
                        let obj: [GameEntity] = try self.handleResponseArray(response: response) as [GameEntity]
                        if coredataGames.count > 0 {
                            for game in coredataGames {
                                PersistenceManager.sharedInstance.delete(game)
                            }
                        }
                        for game in obj {
                            _ = GameConverter.convertToCoreData(entity: game)
                            PersistenceManager.sharedInstance.save()
                        }
                        completionHandler(APIResult.success(obj))
                    } catch {
                        completionHandler(APIResult.failure(APIErrors.jsonMappingError.message()))
                    }
                case .failure(let failure):
                    completionHandler(APIResult.failure(self.handleFailure(failure: failure)))
                }
            }
        } else if coredataGames.count > 0 {
            var games: [GameEntity] = []
            for coredatagame in coredataGames {
                let gameentity = GameConverter.convertToEntity(coredata: coredatagame)
                games.append(gameentity)
            }
            completionHandler(APIResult.success(games))
        } else {
            completionHandler(APIResult.failure(APIErrors.networkUnreachable.message()))
        }
    }
    
    internal func requestGameplay(gameID: Int, completionHandler: @escaping (APIResult<[GameplayEntity], APIError>) -> Void) {
        if Reachability.sharedInstance.isConnected() {
            self.provider.request(.gameplay(gameID: gameID)) { (result) in
                switch result {
                case .success(let response):
                    do {
                        let obj: [GameplayEntity] = try self.handleResponseArray(response: response) as [GameplayEntity]
                        completionHandler(APIResult.success(obj))
                    } catch {
                        completionHandler(APIResult.failure(APIErrors.jsonMappingError.message()))
                    }
                case .failure(let failure):
                    completionHandler(APIResult.failure(self.handleFailure(failure: failure)))
                }
            }
        } else {
            completionHandler(APIResult.failure(APIErrors.networkUnreachable.message()))
        }
    }
    
}
