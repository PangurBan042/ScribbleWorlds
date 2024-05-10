//
//  ArticleEntity+CoreDataProperties.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 10/24/22.
//
//


import Foundation
import CoreData


extension ArticleEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ArticleEntity> {
        return NSFetchRequest<ArticleEntity>(entityName: "ArticleEntity")
    }

    @NSManaged public var idW: UUID?
    @NSManaged public var packIdW: UUID?
    @NSManaged public var nameW: String?
    @NSManaged public var typeW: String?
    @NSManaged public var permanent: Bool
    @NSManaged public var infoW: String?
    @NSManaged public var collected: [Bool]
    @NSManaged public var categoryW: String?
    @NSManaged public var valueW: Int16
    @NSManaged public var on: [Bool]
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
    public var category: String {
        set {categoryW = newValue}
        get {categoryW ?? ""}
    }
    
    public var type: String {
        set {typeW = newValue}
        get {typeW ?? ""}
    }
    
    public var info: String {
        set {infoW = newValue}
        get {infoW ?? ""}
    }
    
    public var value: Int {
        set {valueW = Int16(newValue)}
        get {Int(valueW)}
    }

    public var pack: PackEntity {
        get {packW ?? PackEntity()}
    }

}

extension ArticleEntity : Identifiable {

}
