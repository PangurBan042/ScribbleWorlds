//
//  NavigateEntity+CoreDataProperties.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 5/4/24.
//
//

import Foundation
import CoreData


extension NavigateEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NavigateEntity> {
        return NSFetchRequest<NavigateEntity>(entityName: "NavigateEntity")
    }

    @NSManaged public var idW: UUID?
    @NSManaged public var packIdW: UUID?
    @NSManaged public var menuSelectionW: String?
    @NSManaged public var packW: PackEntity?

    
    public var id: UUID {
        set{idW = newValue}
        get{idW ?? UUID()}
    }
    
    public var packId: UUID {
        set{packIdW = newValue}
        get{packIdW ?? UUID()}
    }
    
    public var menuSelection: String {
        set{menuSelectionW = newValue}
        get{menuSelectionW ?? ""}
    }
    
}

extension NavigateEntity : Identifiable {

}
