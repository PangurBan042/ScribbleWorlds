//
//  CanvasEntity+CoreDataProperties.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 1/6/23.
//
//

import Foundation
import CoreData
import SwiftUI


extension CanvasEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CanvasEntity> {
        return NSFetchRequest<CanvasEntity>(entityName: "CanvasEntity")
    }

    @NSManaged public var idW: UUID?
    @NSManaged public var landIdW: UUID?
    @NSManaged public var dataW: Data?
    @NSManaged public var toolColorW: UIColor?
    @NSManaged public var toolTypeW: String?
    @NSManaged public var toolWidthW: Double
    @NSManaged public var scribbleW: ScribbleEntity?

    public var id: UUID {
        set{idW = newValue}
        get{idW ?? UUID()}
    }
    
    public var landId: UUID {
        set{landIdW = newValue}
        get{landIdW ?? UUID()}
    }
    
    public var data:  Data {
        set {dataW = Data(newValue)}
        get {dataW ?? Data()}
    }
    
    public var toolColor:  UIColor {
        set {toolColorW = newValue}
       get {toolColorW ?? UIColor()}

    }
    
    public var toolType:  String {
        set {toolTypeW = newValue}
       get {toolTypeW ?? String()}

    }
    
    public var toolWidth:  CGFloat {
        set {toolWidthW = CGFloat(newValue)}
        get {CGFloat(toolWidthW)}

    }
//
//    public var toolWidth:  CGFloat {
//        set {toolWidthW = Float(newValue)}
//        get {CGFloat(toolWidthW)}
//    }
    
    public var scribble: ScribbleEntity {
        get {scribbleW ?? ScribbleEntity()}
    }

}

extension CanvasEntity : Identifiable {

}
