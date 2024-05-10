//
//  TabEntity+CoreDataProperties.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 12/14/22.
//
//

import Foundation
import CoreData


extension TabEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TabEntity> {
        return NSFetchRequest<TabEntity>(entityName: "TabEntity")
    }

    @NSManaged public var idW: UUID?
    @NSManaged public var landIdW: UUID?
    @NSManaged public var nameW: String
    @NSManaged public var backgroundNameW: String
    @NSManaged public var spinnerImageNamesW: [String]?
    @NSManaged public var autoPlaceNamesW: [String]?
    @NSManaged public var spinnerNamesW: [String]?
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
        get {nameW}
    }
    
    public var backgroundName: String {
        set {backgroundNameW = newValue}
        get {backgroundNameW}
    }
    
    
    public var spinnerImageNames: [String] {
        set {spinnerImageNamesW = newValue}
        get {spinnerImageNamesW ?? [""]}
    }
    
    public var autoPlaceNames: [String] {
        set {autoPlaceNamesW = newValue}
        get {autoPlaceNamesW ?? [""]}
    }
    
    public var spinnerNames: [String] {
        set {spinnerNamesW = newValue}
        get {spinnerNamesW ?? [""]}
    }
    
    public var land: LandEntity {
        landW ?? LandEntity()
    }

}



extension TabEntity : Identifiable {

}
