//
//  GameCoreDataEntity+CoreDataProperties.swift
//  
//
//  Created by Luiz Felipe Aires Soares on 07/01/19.
//
//

import Foundation
import CoreData


extension GameCoreDataEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GameCoreDataEntity> {
        return NSFetchRequest<GameCoreDataEntity>(entityName: "GameCoreDataEntity")
    }

    @NSManaged public var gameID: Int32
    @NSManaged public var date: String?
    @NSManaged public var time: String?
    @NSManaged public var homeScore: Int16
    @NSManaged public var awayScore: Int16
    @NSManaged public var homePenaltiesScore: Int16
    @NSManaged public var awayPenaltiesScore: Int16
    @NSManaged public var homeTeam: TeamCoreDataEntity?
    @NSManaged public var awayTeam: TeamCoreDataEntity?
    @NSManaged public var local: LocalCoreDataEntity?

}
