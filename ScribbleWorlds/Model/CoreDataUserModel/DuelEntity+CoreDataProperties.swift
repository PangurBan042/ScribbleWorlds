//
//  DuelEntity+CoreDataProperties.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 4/17/24.
//
//

import Foundation
import CoreData


extension DuelEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DuelEntity> {
        return NSFetchRequest<DuelEntity>(entityName: "DuelEntity")
    }

    @NSManaged public var idW: UUID?
    @NSManaged public var landIdW: UUID?
    @NSManaged public var enemyHeartsW: Int16
    @NSManaged public var characterHeartsW: Int16
    @NSManaged public var fightNameW: String?
    @NSManaged public var showDuelView: Bool
    @NSManaged public var landW: LandEntity?

    public var id: UUID {
        set{idW = newValue}
        get{idW ?? UUID()}
    }
    
    public var landId: UUID {
        set{landIdW = newValue}
        get{landIdW ?? UUID()}
    }
    
    public var fightName: String {
        set{fightNameW = newValue}
        get{fightNameW ?? ""}
    }
    
    public var enemyHearts: Int {
        set {enemyHeartsW =  Int16(newValue)}
        get {Int(enemyHeartsW)}
    }
    
    public var characterHearts: Int {
        set {characterHeartsW =  Int16(newValue)}
        get {Int(characterHeartsW)}
    }
}

extension DuelEntity : Identifiable {

}
