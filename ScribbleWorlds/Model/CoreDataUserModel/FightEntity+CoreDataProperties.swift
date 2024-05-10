//
//  FightEntity+CoreDataProperties.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 10/6/22.
//
//

import Foundation
import CoreData


extension FightEntity {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<FightEntity> {
        return NSFetchRequest<FightEntity>(entityName: "FightEntity")
    }
    
    @NSManaged public var idW: UUID?
    @NSManaged public var landIdW: UUID?
    @NSManaged public var nameW: String?
    @NSManaged public var nextFightW: String?
    @NSManaged public var infoW: String?
    @NSManaged public var isDead: Bool
    @NSManaged public var showSpinForLootView: Bool
    @NSManaged public var showDefeatedView: Bool
    @NSManaged public var showDuelView: Bool
    @NSManaged public var articleW: String?
    @NSManaged public var levelW: Int16
    @NSManaged public var countW: Int16
    @NSManaged public var attackPointsW: Int16
    @NSManaged public var defensePointsW: Int16
    @NSManaged public var on: [Bool]
    @NSManaged public var landW: LandEntity?
    
    public var id: UUID {
        set {idW = newValue}
        get {idW ?? UUID()}
    }
    
    public var landId: UUID {
        set {landIdW = newValue}
        get {landIdW ?? UUID()}
    }
    
    public var name: String {
        set {nameW = newValue}
        get {nameW ?? ""}
    }
    
    public var nextFight: String {
        set {nextFightW = newValue}
        get {(nextFightW ?? "")}
    }
    
    public var info: String {
        set {infoW = newValue}
        get {infoW ?? ""}
    }
    
    public var article: String {
        set {articleW = newValue}
        get {articleW ?? ""}
    }
    
    public var level: Int {
        set {levelW = Int16(newValue)}
        get {Int(levelW)}
    }
    
    public var count: Int {
        set {countW = Int16(newValue)}
        get {Int(countW)}
    }
    
    public var attackPoints: Int {
        set {attackPointsW = Int16(newValue)}
        get {Int(attackPointsW)}
    }
    
    public var defensePoints: Int {
        set {defensePointsW = Int16(newValue)}
        get {Int(defensePointsW)}
    }
    
    public var land: LandEntity {
        landW ?? LandEntity()
    }
    
}

extension FightEntity : Identifiable {
    
}

