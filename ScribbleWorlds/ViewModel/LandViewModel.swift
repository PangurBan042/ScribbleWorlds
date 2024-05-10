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
    var previousFight: String = ""
    var priorLand: String = ""
    var afterLand: String = ""
    var fightHeading: String = ""
    var alertType: String = ""
    var questPages: [String] = [""]
    var autoPlaceNames: [String] = [""]
    var currentTabSpun: Bool = false
    var spinnerBackground: String = ""
    var currentFight: String = ""
    
    var isFight: Bool = false
    
    var isBackpack: Bool = false
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
                    previousFight: previousFight,
                    priorLand: priorLand,
                    afterLand: afterLand,
                    name: name,
                    fightHeading: fightHeading,
                    alertType: alertType,
                    questPages: questPages,
                    autoPlaceNames: autoPlaceNames,
                    currentTab: currentTab,
                    currentTabSpun: currentTabSpun,
                    spinnerBackground: spinnerBackground,
                    currentFight: currentFight,
                    spinForLootOn: spinForLootOn,
                    isFight: isFight,
                    readInfo: readInfo,
                    isBackpack: isBackpack,
                    currentArticles: currentArticles)
    }
   
    func getData(packId:UUID, name: String) {
        let landData =  CoreDataManager.instance.getLand(packId: packId, name:name)
        self.id = landData.id
        self.packId = landData.packId
        scribbleId = landData.scribbleId
        self.name = landData.name
        questPages = landData.questPages
        previousFight = landData.previousFight
        priorLand = landData.priorLand
        afterLand = landData.afterLand
        currentTab = landData.currentTab
        currentTabSpun = landData.currentTabSpun
        spinnerBackground = landData.spinnerBackground
        currentFight = landData.currentFight
        fightHeading = landData.fightHeading
        alertType = landData.alertType
        spinForLootOn = landData.spinForLootOn
        isFight = landData.isFight
        readInfo = landData.readInfo
        isBackpack = landData.isBackpack
        autoPlaceNames = landData.autoPlaceNames
        currentArticles = landData.currentArticles
    }
}
