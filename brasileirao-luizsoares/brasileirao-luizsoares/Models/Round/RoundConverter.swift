//
//  RoundConverter.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 08/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import Foundation
import CoreData

class RoundConverter {
    
    // MARK: - Convert Functions
    
    class func convertToCoreData(entity: RoundEntity) -> RoundCoreDataEntity {
        let persistence = PersistenceManager.sharedInstance
        
        let coredata = RoundCoreDataEntity(context: persistence.context)
        coredata.current    = Int16(entity.current)
        coredata.total      = Int16(entity.total)
        return coredata
    }
    
    class func convertToEntity(coredata: RoundCoreDataEntity) -> RoundEntity {
        var entity = RoundEntity()
        entity.total        = Int(coredata.total)
        entity.current      = Int(coredata.current)
        return entity
    }
}
