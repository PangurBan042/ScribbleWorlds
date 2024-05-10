//
//  LifeViewModel.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 4/4/24.
//

import Foundation

//public class LifeViewModel: ObservableObject {
//    
//    var id: UUID = UUID()
//    var packId: UUID = UUID()
//    @Published var heart: [Bool] = []
//    @Published var water: [Bool] = []
//    var heartCount: Int = 0
//    var waterCount: Int = 0
//    
//    
//    
//    deinit {
//        print("LifeManager is deinitialized")
//    }
//    
////    init(packId: UUID) {
////        getData(packId: packId)
////    }
////    
//    func getData(packId:UUID) {
//        let lifeData =  CoreDataManager.instance.getLife(packId: packId)
//        id = lifeData.id
//        self.packId = lifeData.packId
//        heart = lifeData.heart
//        water = lifeData.water
//        heartCount = lifeData.heartCount
//        waterCount = lifeData.waterCount
//    }
//    
//    func updateData() {
//        CoreDataManager.instance.updateLife(packId: packId,
//                                            heart: heart,
//                                            water: water,
//                                            heartCount: heartCount,
//                                            waterCount: waterCount)
//    }
//    
//}
//
//import Foundation
