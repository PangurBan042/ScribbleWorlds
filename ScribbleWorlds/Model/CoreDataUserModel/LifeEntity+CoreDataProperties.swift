//
//  LifeEntity+CoreDataProperties.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 12/12/22.
//
//

import Foundation
import CoreData


extension LifeEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LifeEntity> {
        return NSFetchRequest<LifeEntity>(entityName: "LifeEntity")
    }

    @NSManaged public var idW: UUID?
    @NSManaged public var packIdW: UUID?
    @NSManaged public var heartW: [Bool]?
    @NSManaged public var heartCountW: Int16
    @NSManaged public var waterW: [Bool]?
    @NSManaged public var waterCountW: Int16
    @NSManaged public var packW: PackEntity?
    
    public var id: UUID {
        set{idW = newValue}
        get{idW ?? UUID()}
    }
    
    public var packId: UUID {
        set{packIdW = newValue}
        get{packIdW ?? UUID()}
    }
    
    public var heart: [Bool] {
        set {heartW =  newValue}
        get {heartW ?? []}
    }
    
    public var heartCount: Int {
        set {heartCountW =  Int16(newValue)}
        get {Int(heartCountW)}
    }
    
    public var water: [Bool] {
        set {waterW =  newValue}
        get {waterW ?? []}
    }
    
    public var waterCount: Int {
        set {waterCountW =  Int16(newValue)}
        get {Int(waterCountW)}
    }
    
    public var pack: PackEntity {
        get {packW ?? PackEntity()}
    }

}

extension LifeEntity : Identifiable {

}
