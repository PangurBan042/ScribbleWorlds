//
//  SpinnerViewModel.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 3/26/24.
//

import Foundation

public class SpinnerViewModel: ObservableObject {
    

    var name:String = ""
    var id = UUID()
    var landId:UUID = UUID()
    var wedgeName:String = ""
    var wedgeIndex:Int = 0
    var wedgeInfo:String = ""
    var wedgeNames:[String] = [""]
    var showInfo:Bool = false
    
    deinit {
        print("SpinnerManager is deinitialized")
    }
    
//    init(landId:UUID, name: String){
//        getData(landId: landId, name: name)
//    }
    
    func updateWedgeName () {
        CoreDataManager.instance.updateSpinnerWedgeName(spinnerId: id, wedgeName: wedgeName)
    }
    
    func updateWedgeIndex() {
        CoreDataManager.instance.updateSpinnerWedgeIndex(spinnerId: id, wedgeIndex: Int(wedgeIndex))
    }
    
    func updateWedgeInfo() {
        CoreDataManager.instance.updateSpinnerWedgeInfo(spinnerId: id, wedgeInfo: wedgeInfo)
    }
    
    func updateShowInfo() {
        CoreDataManager.instance.updateSpinnerShowInfo(spinnerId: id, showInfo: showInfo)
    }
    
    func updateSpinnerWedge() {
        CoreDataManager.instance.updateSpinnerWedge(spinnerId: id, wedgeName: wedgeName, wedgeIndex: wedgeIndex, wedgeInfo:wedgeInfo)
    }
    
    
    func getData(landId:UUID, name: String) {
        let spinnerData =  CoreDataManager.instance.getSpinner(landId: landId, name:name)
        
        id = spinnerData.id
        self.landId = spinnerData.landId
        self.name = spinnerData.name
        wedgeName = spinnerData.wedgeName
        wedgeInfo = spinnerData.wedgeInfo
        wedgeIndex = spinnerData.wedgeIndex
        wedgeNames = spinnerData.wedgeNames
        showInfo = spinnerData.showInfo
       
    }
    
    func getData(id:UUID) {
        let spinnerData =  CoreDataManager.instance.getSpinner(id: id)
        self.id = spinnerData.id
        self.landId = spinnerData.landId
        self.name = spinnerData.name
        wedgeName = spinnerData.wedgeName
        wedgeInfo = spinnerData.wedgeInfo
        wedgeIndex = spinnerData.wedgeIndex
        wedgeNames = spinnerData.wedgeNames
        showInfo = spinnerData.showInfo
    }
    
    
    func updateData() {
        CoreDataManager.instance.updateSpinner(id: id,
                                            landId: landId,
                                            name: name,
                                            wedgeName: wedgeName,
                                            wedgeInfo: wedgeInfo,
                                            wedgeIndex: wedgeIndex,
                                            wedgeNames: wedgeNames,
                                            showInfo: showInfo)
    }
}
