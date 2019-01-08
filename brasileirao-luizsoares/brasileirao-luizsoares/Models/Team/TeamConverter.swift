//
//  TeamConverter.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 08/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import Foundation
import CoreData

class TeamConverter {
    
    // MARK: - Converter functions
    
    class func convertToEntity(coredata: TeamCoreDataEntity) -> TeamEntity {
        var entity = TeamEntity()
        entity.shieldURL = coredata.shieldURL ?? ""
        entity.fullName = coredata.fullName ?? ""
        entity.initials = coredata.initials ?? ""
        return entity
    }
    
    class func convertToCoreDataEntity(entity: TeamEntity) -> TeamCoreDataEntity {
        let coredata = TeamCoreDataEntity()
        coredata.shieldURL  = entity.shieldURL
        coredata.fullName   = entity.fullName
        coredata.initials   = entity.initials
        return coredata
    }
}
