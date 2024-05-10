//
//  SettingsEntity+CoreDataProperties.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 5/4/23.
//
//

import Foundation
import CoreData


extension SettingsEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SettingsEntity> {
        return NSFetchRequest<SettingsEntity>(entityName: "SettingsEntity")
    }

    @NSManaged public var idW: UUID?
    @NSManaged public var packIdW: UUID?
    @NSManaged public var autofillW: String?
    @NSManaged public var showCharacter: Bool
    @NSManaged public var packW: PackEntity?
    
    public var id: UUID {
        set {idW = newValue}
        get {idW ?? UUID()}
    }
    
    public var packId: UUID {
        set {packIdW = newValue}
        get {packIdW ?? UUID()}
    }
    
    public var autofill:  String {
        set {autofillW = newValue}
        get {autofillW ?? ""}
    }
   
    public var pack: PackEntity {
        get {packW ?? PackEntity()}
    }


}

extension SettingsEntity : Identifiable {

}
