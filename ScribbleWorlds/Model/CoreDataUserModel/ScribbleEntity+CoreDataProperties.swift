//
//  ScribbleEntity+CoreDataProperties.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 12/9/22.
//
//

import Foundation
import CoreData


extension ScribbleEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ScribbleEntity> {
        return NSFetchRequest<ScribbleEntity>(entityName: "ScribbleEntity")
    }

    @NSManaged public var idW: UUID?
    @NSManaged public var landIdW: UUID?
    @NSManaged public var gridSizeW: Int16
    @NSManaged public var youAreHereXW: Double
    @NSManaged public var youAreHereYW: Double
    @NSManaged public var backgroundW: String?
    @NSManaged public var elementsW: [[String]]?
    @NSManaged public var landW: LandEntity?
    @NSManaged public var canvasW: CanvasEntity?
    
    public var id: UUID {
        set {idW = newValue}
        get {idW ?? UUID()}
    }
    
    public var landId: UUID {
        set {landIdW = newValue}
        get {landIdW ?? UUID()}
    }
    
    public var gridSize: Int {
        set {gridSizeW = Int16(newValue)}
        get {Int(gridSizeW)}
    }
    
    public var youAreHereX: Double {
        set {youAreHereXW = newValue}
        get {youAreHereXW}
    }
    
    public var youAreHereY: Double {
        set {youAreHereYW = newValue}
        get {youAreHereYW}
    }
    
    public var background:  String {
        set {backgroundW = newValue}
        get {backgroundW ?? ""}
    }
    
    public var elements: [[String]] {
        set {elementsW = newValue}
        get { elementsW ?? [[String]]() }
    }
    
    public var land: LandEntity {
        landW ?? LandEntity()
    }
    
    public var canvas: CanvasEntity {
        set {canvasW = newValue}
        get{canvasW ?? CanvasEntity()}
    }
    
}

extension ScribbleEntity : Identifiable {

}
