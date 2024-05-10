//
//  WaterViewModel.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 4/10/24.
//


import Foundation

public class WaterViewModel: ObservableObject {
    
    var id: UUID = UUID()
    var packId: UUID = UUID()
    @Published var on: [Bool] = []
    var count: Int = 0
    var tempCount: Int = 0
    
    
    deinit {
        print("LifeManager is deinitialized")
    }
    
    init(packId: UUID) {
        getData(packId: packId)
    }
    
    func getData(packId:UUID) {
        let heartsData =  CoreDataManager.instance.getWater(packId: packId)
        id = heartsData.id
        self.packId = heartsData.packId
        on = heartsData.on
        tempCount = heartsData.tempCount
        count = heartsData.count
    }

    
    func updateWater() {
        CoreDataManager.instance.updateHearts(packId: packId,
                                            on: on,
                                            count: count,
                                            tempCount: tempCount)
    }
    
}
