//  TabTestManager.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 10/20/23.
//

import Foundation


public class TabViewModel: ObservableObject {
    
    
    
    var id: UUID = UUID()
    @Published var name: String = ""
    var backgroundName: String = ""
    var landId: UUID = UUID()
    var spinnerImageNames: [String] = [""]
    var spinnerNames: [String] = [""]
    
    init(landId: UUID){
        self.landId = landId
        getData(landId:self.landId)
    }
    
    deinit {
        print("TabManager is deinitialized")
    }
    
    func getData(landId:UUID) {
        let tabData =  CoreDataManager.instance.getTab(landId: landId)
        id = tabData.id
        self.landId = tabData.landId
        name = tabData.name
        backgroundName = tabData.backgroundName
        spinnerImageNames = tabData.spinnerImageNames
        spinnerNames = tabData.spinnerNames
    }
    
    func updateData() {
        CoreDataManager.instance.updateTab(landId: landId,
                            name: name,
                            backgroundName: backgroundName)
    }
    
    func getAllTabs() -> [TabEntity] {
        return  CoreDataManager.instance.getAllTabs()
    }
}
