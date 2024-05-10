//
//  HeartsEntity+CoreDataProperties.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 4/10/24.
//
//

import Foundation
import CoreData


extension HeartsEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HeartsEntity> {
        return NSFetchRequest<HeartsEntity>(entityName: "HeartsEntity")
    }

    @NSManaged public var idW: UUID?
    @NSManaged public var packIdW: UUID?
    @NSManaged public var onW: [Bool]?
    @NSManaged public var tempCountW: Int16
    @NSManaged public var countW: Int16
    @NSManaged public var packW: PackEntity?
    
    public var id: UUID {
        set{idW = newValue}
        get{idW ?? UUID()}
    }
    
    public var packId: UUID {
        set{packIdW = newValue}
        get{packIdW ?? UUID()}
    }
    
    public var on: [Bool] {
        set{onW = newValue}
        get{onW ?? []}
    }
    
    public var tempCount: Int {
        set {tempCountW =  Int16(newValue)}
        get {Int(tempCountW)}
    }
    
    public var count: Int {
        set {countW =  Int16(newValue)}
        get {Int(countW)}
    }
}

extension HeartsEntity : Identifiable {

}
