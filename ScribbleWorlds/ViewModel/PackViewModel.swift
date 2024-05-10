//
//  PackViewModel.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 4/3/24.
//

import Foundation


public class PackViewModel: ObservableObject {
    
    var id: UUID = UUID()
    var date: Date = Date()
    var name: String = ""
    var type: String = ""
    var helpPages: [String] = [""]
    var currentLand: String = ""

    deinit {
        print("PackManager is deinitialized")
    }


    func addData(packName: String) {
        let packDefault = PackDefaults.getData(from:packName)
        CoreDataManager.instance.addData(packDefault: packDefault, packId:id)
        getData(packId: id)
    }
    
    func getData(packId:UUID) {
        let packData =  CoreDataManager.instance.getPack(packId: packId)
        self.id = packData.id
        date = packData.date
        name = packData.name
        type = packData.type
        helpPages = packData.helpPages
        currentLand = packData.currentLand        
    }
    
    func updateData() {
        CoreDataManager.instance.updatePack(packId:id,
                                            date:date,
                                            currentLand: currentLand)
    }
    

    func deleteData(id: UUID) {
        CoreDataManager.instance.deleteData(id:id)
    }
}
