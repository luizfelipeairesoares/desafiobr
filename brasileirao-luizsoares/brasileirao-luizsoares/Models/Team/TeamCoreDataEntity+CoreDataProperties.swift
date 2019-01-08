//
//  TeamCoreDataEntity+CoreDataProperties.swift
//  
//
//  Created by Luiz Felipe Aires Soares on 07/01/19.
//
//

import Foundation
import CoreData


extension TeamCoreDataEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TeamCoreDataEntity> {
        return NSFetchRequest<TeamCoreDataEntity>(entityName: "TeamCoreDataEntity")
    }

    @NSManaged public var shieldURL: String?
    @NSManaged public var fullName: String?
    @NSManaged public var initials: String?

}
