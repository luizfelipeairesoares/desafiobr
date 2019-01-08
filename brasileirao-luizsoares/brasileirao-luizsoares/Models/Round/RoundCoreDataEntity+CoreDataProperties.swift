//
//  RoundCoreDataEntity+CoreDataProperties.swift
//  
//
//  Created by Luiz Felipe Aires Soares on 08/01/19.
//
//

import Foundation
import CoreData


extension RoundCoreDataEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RoundCoreDataEntity> {
        return NSFetchRequest<RoundCoreDataEntity>(entityName: "RoundCoreDataEntity")
    }

    @NSManaged public var total: Int16
    @NSManaged public var current: Int16

}
