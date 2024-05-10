//
//  AdventureEntity+CoreDataProperties.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 3/22/23.
//
//

import Foundation
import CoreData


extension AdventureEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AdventureEntity> {
        return NSFetchRequest<AdventureEntity>(entityName: "AdventureEntity")
    }

    @NSManaged public var idW: UUID?
    @NSManaged public var packIdW: UUID?
    @NSManaged public var packNameW: String?
    @NSManaged public var packDateW: Date?
    @NSManaged public var thumbnailW: Data?
    
    public var id: UUID {
        set{idW = newValue}
        get{idW ?? UUID()}
    }
    
   
    public var packId: UUID {
        set{packIdW = newValue}
        get{packIdW ?? UUID()}
    }
    
    public var packName: String {
        set{packNameW = newValue}
        get{packNameW ?? ""}
    }
    
    public var packDate: Date {
        set{packDateW = newValue}
        get{packDateW ?? Date()}
    }
    
    public var thumbnail:  Data {
        set {thumbnailW = Data(newValue)}
        get {thumbnailW ?? Data()}
    }
    
   

}

extension AdventureEntity : Identifiable {

}

