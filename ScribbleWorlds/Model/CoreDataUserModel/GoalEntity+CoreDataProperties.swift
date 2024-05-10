//
//  GoalEntity+CoreDataProperties.swift
//  ScribbleWorlds 1.1
//
//  Created by Franny Moyse on 6/10/22.
//
//

import Foundation
import CoreData


extension GoalEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GoalEntity> {
        return NSFetchRequest<GoalEntity>(entityName: "GoalEntity")
    }

    @NSManaged public var idW: UUID?
    @NSManaged public var packIdW: UUID?
    @NSManaged public var currentLandW: String?
    @NSManaged public var nameW: String?
    @NSManaged public var on: Bool
    @NSManaged public var landW: LandEntity?
    
    public var id: UUID {
        set {idW = newValue}
        get {idW ?? UUID()}
    }
    
    public var packId: UUID {
        set {packIdW = newValue}
        get {packIdW ?? UUID()}
    }
    
    public var name: String {
        set {nameW = newValue}
        get {nameW ?? ""}
    }
    
    public var currentLand: String {
        set {currentLandW = newValue}
        get {currentLandW ?? ""}
    }
    
    public var land: LandEntity {
        landW ?? LandEntity()
    }

}

extension GoalEntity : Identifiable {

}
