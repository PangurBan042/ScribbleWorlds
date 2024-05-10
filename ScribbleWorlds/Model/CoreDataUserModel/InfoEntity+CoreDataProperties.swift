//
//  InfoEntity+CoreDataProperties.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 4/3/24.
//
//

import Foundation
import CoreData


extension InfoEntity {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<InfoEntity> {
        return NSFetchRequest<InfoEntity>(entityName: "InfoEntity")
    }
    
    @NSManaged public var allLevelsW: [String]?
    @NSManaged public var armorNameW: String?
    @NSManaged public var armorValueW: Int16
    @NSManaged public var attackPointsW: Int16
    @NSManaged public var defensePointsW: Int16
    @NSManaged public var helmNameW: String?
    @NSManaged public var helmValueW: Int16
    @NSManaged public var idW: UUID?
    @NSManaged public var levelW: Int16
    @NSManaged public var packIdW: UUID?
    @NSManaged public var shieldNameW: String?
    @NSManaged public var shieldValueW: Int16
    @NSManaged public var weaponNameW: String?
    @NSManaged public var weaponValueW: Int16
    @NSManaged public var packW: PackEntity?
    
    public var id: UUID {
        set {idW = newValue}
        get {idW ?? UUID()}
    }
    
    public var packId: UUID {
        set {packIdW = newValue}
        get {packIdW ?? UUID()}
    }
    
    public var level: Int {
        set {levelW = Int16(newValue)}
        get {Int(levelW)}
    }
    
    
    public var allLevels:  [String] {
        set {allLevelsW = newValue}
        get {allLevelsW ?? [String]() }
    }
    
    public var weaponName:  String {
        set {weaponNameW = newValue}
        get {weaponNameW ?? ""}
    }
    
    public var weaponValue:  Int {
        set {weaponValueW = Int16(newValue)}
        get {Int(weaponValueW)}
    }
    
    public var armorName:  String {
        set {armorNameW = newValue}
        get {armorNameW ?? ""}
    }
    public var armorValue:  Int {
        set {armorValueW = Int16(newValue)}
        get {Int(armorValueW)}
    }
    
    public var shieldName:  String {
        set {shieldNameW = newValue}
        get {shieldNameW ?? ""}
    }
    
    public var shieldValue:  Int {
        set {shieldValueW = Int16(newValue)}
        get {Int(shieldValueW)}
    }
    
    public var helmName:  String {
        set {helmNameW = newValue}
        get {helmNameW ?? ""}
    }
    
    public var helmValue:  Int {
        set {helmValueW = Int16(newValue)}
        get {Int(helmValueW)}
    }
    
    
    public var attackPoints: Int {
        set {attackPointsW = Int16(newValue)}
        get {Int(attackPointsW)}
    }
    
    public var defensePoints: Int {
        set {defensePointsW = Int16(newValue)}
        get {Int(defensePointsW)}
    }
    
    
    public var pack: PackEntity {
        get {packW ?? PackEntity()}
    }
    
    
}

extension InfoEntity : Identifiable {
    
}





