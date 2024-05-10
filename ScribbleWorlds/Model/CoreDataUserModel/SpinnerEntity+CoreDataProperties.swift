//
//  SpinnerEntity+CoreDataProperties.swift
//  ScribbleWorlds 1.1
//
//  Created by Franny Moyse on 6/18/22.
//
//

import Foundation
import CoreData


extension SpinnerEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SpinnerEntity> {
        return NSFetchRequest<SpinnerEntity>(entityName: "SpinnerEntity")
    }

    @NSManaged public var nameW: String?
    @NSManaged public var idW: UUID?
    @NSManaged public var landIdW: UUID?
    @NSManaged public var wedgeNameW: String?
    @NSManaged public var wedgeAngleW: Double
    @NSManaged public var wedgeIndexW: Int16
    @NSManaged public var wedgeInfoW: String?
    @NSManaged public var wedgeNamesW: [String]?
    @NSManaged public var showInfo: Bool
    @NSManaged public var landW: LandEntity?
    
    public var name: String {
        set {nameW = newValue}
        get {nameW ?? ""}
    }
    
    public var id: UUID {
        set {idW = newValue}
        get {idW ?? UUID()}
    }
    
    public var landId: UUID {
        set {landIdW = newValue}
        get {landIdW ?? UUID()}
    }
    
    public var wedgeName: String {
        set {wedgeNameW = newValue}
        get {wedgeNameW ?? ""}
    }
    
    public var wedgeNames: [String] {
        set {wedgeNamesW = newValue}
        get {wedgeNamesW ?? []}
    }
    
    public var wedgeInfo: String {
        set {wedgeInfoW = newValue}
        get {wedgeInfoW ?? ""}
    }
    
    public var wedgeIndex: Int {
        set {wedgeIndexW = Int16(newValue)}
        get {Int(wedgeIndexW)}
    }
    
   
    public var wedgeAngle: Double {
        set {wedgeAngleW = Double(newValue)}
        get {Double(wedgeAngleW)}
    }
    
    public var land: LandEntity {
        landW ?? LandEntity()
    }

}

extension SpinnerEntity : Identifiable {

}
