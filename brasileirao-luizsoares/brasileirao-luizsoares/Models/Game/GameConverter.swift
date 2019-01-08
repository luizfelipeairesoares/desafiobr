//
//  GameConverter.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 08/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import Foundation
import CoreData

class GameConverter {
    
    // MARK: - Converter Functions
    
    class func convertToCoreData(entity: GameEntity) -> GameCoreDataEntity {
        let persistence = PersistenceManager.sharedInstance
        
        let coredata = GameCoreDataEntity(context: persistence.context)
        coredata.gameID             = Int32(entity.gameID)
        coredata.date               = entity.date
        coredata.time               = entity.time
        coredata.homeScore          = Int16(entity.homeScore)
        coredata.awayScore          = Int16(entity.awayScore)
        if let homePenalties = entity.homePenaltiesScore {
            coredata.homePenaltiesScore = Int16(homePenalties)
        }
        if let awayPenalties = entity.awayPenaltiesScore {
            coredata.awayPenaltiesScore = Int16(awayPenalties)
        }
        coredata.homeTeam           = TeamConverter.convertToCoreDataEntity(entity: entity.teams["mandante"]!)
        coredata.awayTeam           = TeamConverter.convertToCoreDataEntity(entity: entity.teams["visitante"]!)
        coredata.local              = LocalConverter.convertToCoreData(entity: entity.local)
        return coredata
    }
    
    class func convertToEntity(coredata: GameCoreDataEntity) -> GameEntity {
        var entity = GameEntity()
        entity.gameID               = Int(coredata.gameID)
        entity.date                 = coredata.date ?? ""
        entity.time                 = coredata.time ?? ""
        entity.homeScore            = Int(coredata.homeScore)
        entity.awayScore            = Int(coredata.awayScore)
        entity.homePenaltiesScore   = Int(coredata.homePenaltiesScore)
        entity.awayPenaltiesScore   = Int(coredata.awayPenaltiesScore)
        entity.teams                = ["mandante"   : TeamConverter.convertToEntity(coredata: coredata.homeTeam!),
                                       "visitante"   : TeamConverter.convertToEntity(coredata: coredata.awayTeam!)]
        entity.local                = LocalConverter.convertToEntity(coredata: coredata.local!)
        return entity
    }
    
}
