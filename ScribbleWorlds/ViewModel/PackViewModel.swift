//
//  PackViewModel.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 4/3/24.
//

//import Foundation
//
//
//public class PackViewModel: ObservableObject {
//    
//    var id: UUID = UUID()
//    var adventureId: UUID = UUID()
//    var date: Date = Date()
//    var name: String = ""
//    var type: String = ""
//    var helpPages: [String] = [""]
//    var afterLand: String = ""
//    var currentLand: String = ""
//    var currentLandThumbnail: Data = Data()
//    var isBackpack: Bool = false
//    var isBook: Bool = false
//    var isDead: Bool = false
//    
////    init (packId: UUID) {
////        id = packId
////        getData(packId:self.id)
////    }
//
//    deinit {
//        print("PackManager is deinitialized")
//    }
//
//
//    func addData(packName: String) {
//        let packDefault = PackDefaults.getData(from:packName)
//        CoreDataManager.instance.addData(packDefault: packDefault, packId:id)
//    }
//    
//    func getData(packId:UUID) {
//        let packData =  CoreDataManager.instance.getPack(packId: packId)
//        self.id = packData.id
//        adventureId = packData.adventureId
//        date = packData.date
//        name = packData.name
//        type = packData.type
//        helpPages = packData.helpPages
//        currentLand = packData.currentLand
//        currentLandThumbnail = packData.currentLandThumbnail
//        isBackpack = false
//        isBook = false
//        isDead = packData.isDead
//        
//    }
//    
//    func updateData() {
//        CoreDataManager.instance.updatePack(packId:id,
//                                            date:date,
//                                            currentLand: currentLand,
//                                            currentLandThumbnail:
//                                                currentLandThumbnail,
//                                            isDead: isDead)
//    }
//    
//
//    func deleteData(id: UUID) {
//        CoreDataManager.instance.deleteData(id:id)
//    }
//    
//}
//
//
//
//
//
//
//
//
