//
//  LandTestManager.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 10/18/23.
//

import Foundation


class LandViewModel: ObservableObject {
   
    
    @Published var overlayTabName = ""
    @Published var overlayTempView = ""
    @Published var readInfo: Bool = false
    @Published var name: String = ""
    @Published var spinForLootOn: Bool = false
    @Published var currentTab: String = ""
    var id: UUID = UUID()
    var packId: UUID = UUID()
    var scribbleId: UUID = UUID()
    var tabId: UUID = UUID()
    var priorLand: String = ""
    var afterLand: String = ""
    var fightHeading: String = ""
    var alertType: String = ""
    var questPages: [String] = [""]
    var autoPlaceNames: [String] = [""]
    var spinnerBackground: String = ""
    var currentFight: String = ""
    var currentArticles: [String] = [""]
    
    init(packId:UUID, name: String){
        self.packId = packId
        getData(packId: packId, name: name)
    }
    
    deinit {
        print("LandTestManager is deinitialized")
    }
    
    func updateReadInfo() {
        CoreDataManager.instance.updateLandReadInfo (id:id,
                                                     readInfo: readInfo
                                    )
    }
   
    func updateData() {
        CoreDataManager.instance.updateLand(id: id,
                    packId: packId,
                    scribbleId: scribbleId,
                    tabId: tabId,
                    priorLand: priorLand,
                    afterLand: afterLand,
                    name: name,
                    fightHeading: fightHeading,
                    alertType: alertType,
                    questPages: questPages,
                    autoPlaceNames: autoPlaceNames,
                    currentTab: currentTab,
                    spinnerBackground: spinnerBackground,
                    currentFight: currentFight,
                    readInfo: readInfo,
                    currentArticles: currentArticles)
    }
   
    func getData(packId:UUID, name: String) {
        let landData =  CoreDataManager.instance.getLand(packId: packId, name:name)
        self.id = landData.id
        self.packId = landData.packId
        scribbleId = landData.scribbleId
        self.name = landData.name
        questPages = landData.questPages
        priorLand = landData.priorLand
        afterLand = landData.afterLand
        currentTab = landData.currentTab
        spinnerBackground = landData.spinnerBackground
        currentFight = landData.currentFight
        fightHeading = landData.fightHeading
        alertType = landData.alertType
        readInfo = landData.readInfo
        autoPlaceNames = landData.autoPlaceNames
        currentArticles = landData.currentArticles
    }
}
