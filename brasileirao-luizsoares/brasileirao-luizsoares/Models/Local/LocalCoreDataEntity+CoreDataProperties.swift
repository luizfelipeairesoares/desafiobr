//
//  LocalCoreDataEntity+CoreDataProperties.swift
//  
//
//  Created by Luiz Felipe Aires Soares on 07/01/19.
//
//

import Foundation
import CoreData


extension LocalCoreDataEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LocalCoreDataEntity> {
        return NSFetchRequest<LocalCoreDataEntity>(entityName: "LocalCoreDataEntity")
    }

    @NSManaged public var local: String?

}
