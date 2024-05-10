//
//  ScribbleManager.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 12/9/22.
//

//import Foundation
//
//
//public class ScribbleViewModel: ObservableObject {
//    
//    
//    
//    deinit {
//        print("GridManager is deinitialized")
//    }
//    
//
//   // @Published public var id: UUID = UUID()
//    var id: UUID = UUID()
//    var landId: UUID = UUID()
//    var gridSize: Int = 0
//    var youAreHereX: Double = 0.0
//    var youAreHereY: Double = 0.0
//    var background: String = ""
//    @Published var elements: [[String]] = [[""]]
//    
//    
//    init(scribbleId: UUID) {
//        getData(scribbleId: scribbleId)
//    }
//    
//    func setElement(row:Int, col:Int, value:String) {
//        elements[row][col] = value
//    }
//   
//    func updateData() {
//        CoreDataManager.instance.updateScribble(scribbleId: id,
//                                    elements: elements,
//                                    youAreHereX: youAreHereX,
//                                    youAreHereY: youAreHereY)
//    }
//    
//    func getData(scribbleId:UUID) {
//        let scribbleData =  CoreDataManager.instance.getScribble(scribbleId: scribbleId)
//        id = scribbleData.id
//        landId = scribbleData.landId
//        gridSize = scribbleData.gridSize
//        background = scribbleData.background
//        elements = scribbleData.elements
//        youAreHereX = scribbleData.youAreHereX
//        youAreHereY = scribbleData.youAreHereY
//    }
//    
//}
//    
