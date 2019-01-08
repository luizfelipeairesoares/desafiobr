//
//  LocalConverter.swift
//  brasileirao-luizsoares
//
//  Created by Luiz Felipe Aires Soares on 08/01/19.
//  Copyright © 2019 globo. All rights reserved.
//

import Foundation
import CoreData

class LocalConverter {
    
    // MARK: - Converter Functions
    
    class func convertToEntity(coredata: LocalCoreDataEntity) -> LocalEntity {
        var entity = LocalEntity()
        entity.name = coredata.local ?? ""
        return entity
    }
    
    class func convertToCoreData(entity: LocalEntity) -> LocalCoreDataEntity {
        let coredata = LocalCoreDataEntity()
        coredata.local = entity.name
        return coredata
    }
    
}
