//
//  ToolEntity+CoreDataProperties.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 12/7/22.
//
//

import Foundation
import CoreData


extension ToolEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToolEntity> {
        return NSFetchRequest<ToolEntity>(entityName: "ToolEntity")
    }

    @NSManaged public var idW: UUID?
    @NSManaged public var packIdW: UUID?
    @NSManaged public var nameW: String?
    @NSManaged public var pointW: Int16
    @NSManaged public var infoW: String?
    @NSManaged public var on: Bool
    @NSManaged public var packW: PackEntity?
    
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
    
    public var point: Int {
        set {pointW = Int16(newValue)}
        get {Int(pointW)}
    }
    
    public var info: String {
        set {infoW = newValue}
        get {infoW ?? ""}
    }
    
    public var pack: PackEntity {
        get {packW ?? PackEntity()}
    }

}

extension ToolEntity : Identifiable {

}
