//
//  PackEntity+CoreDataProperties.swift
//  ScribbleWorlds 1.1
//
//  Created by Franny Moyse on 6/10/22.
//
//

import Foundation
import CoreData


extension PackEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PackEntity> {
        return NSFetchRequest<PackEntity>(entityName: "PackEntity")
    }

    @NSManaged public var nameW: String?
    @NSManaged public var typeW: String?
    @NSManaged public var helpPagesW: [String]?
    @NSManaged public var currentLandW: String?
    @NSManaged public var dateW: Date?
    @NSManaged public var idW: UUID?
    @NSManaged public var landsW: NSSet?
    @NSManaged public var articlesW: NSSet?
    @NSManaged public var lifeW: LifeEntity?
    @NSManaged public var settingsW: SettingsEntity?
    
    public var name: String {
        set{nameW = newValue}
        get{nameW ?? ""}
    }
    
    public var type: String {
        set{nameW = newValue}
        get{nameW ?? ""}
    }
    
    public var helpPages: [String] {
        set {helpPagesW = newValue}
        get {helpPagesW ?? [""]}
    }
    
    public var currentLand: String {
        set{currentLandW = newValue}
        get {currentLandW ?? ""}
    }
    
    public var date: Date {
        set{dateW = newValue}
        get {dateW ?? Date()}
    }
    
    public var id: UUID {
        set{idW = newValue}
        get{idW ?? UUID()}
    }
    
    
    public var lands: [LandEntity] {
        Array(landsW as? Set<LandEntity> ?? [])
    }
    
    
    public var articles: [ArticleEntity] {
        Array(articlesW as? Set<ArticleEntity> ?? [])
    }
    
    public var life: LifeEntity {
        set{lifeW = newValue}
        get{lifeW ?? LifeEntity()}
    }
    
    public var settings: SettingsEntity {
        set{settingsW = newValue}
        get{settingsW ?? SettingsEntity()}
    }
    

}

// MARK: Generated accessors for landsW
extension PackEntity {

    @objc(addLandsWObject:)
    @NSManaged public func addToLandsW(_ value: LandEntity)

    @objc(removeLandsWObject:)
    @NSManaged public func removeFromLandsW(_ value: LandEntity)

    @objc(addLandsW:)
    @NSManaged public func addToLandsW(_ values: NSSet)

    @objc(removeLandsW:)
    @NSManaged public func removeFromLandsW(_ values: NSSet)
    
    

}

// MARK: Generated accessors for itemsW
extension PackEntity {

    @objc(addItemsW:)
    @NSManaged public func addToItemsW(_ values: NSSet)

    @objc(removeItemsW:)
    @NSManaged public func removeFromItemsW(_ values: NSSet)
}

// MARK: Generated accessors for articlesW
extension PackEntity {

    @objc(addArticlesWObject:)
    @NSManaged public func addToArticlesW(_ value: ArticleEntity)

    @objc(removeArticlesWObject:)
    @NSManaged public func removeFromArticlesW(_ value: ArticleEntity)

    @objc(addArticlesW:)
    @NSManaged public func addToArticlesW(_ values: NSSet)

    @objc(removeArticlesW:)
    @NSManaged public func removeFromArticlesW(_ values: NSSet)
}

// MARK: Generated accessors for LevelsW

extension PackEntity {

    @objc(addToolsWObject:)
    @NSManaged public func addToToolsW(_ value: ToolEntity)

    @objc(removeToolsWObject:)
    @NSManaged public func removeFromToolsW(_ value: ToolEntity)

    @objc(addToolsW:)
    @NSManaged public func addToToolsW(_ values: NSSet)

    @objc(removeToolsW:)
    @NSManaged public func removeFromToolsW(_ values: NSSet)
}



extension PackEntity : Identifiable {

}
