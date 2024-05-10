//
//  Store.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 11/8/23.
//

//import Foundation
//import Spinner
//
//class DataManager: ObservableObject {
//    
//    var wedge: Wedge = Wedge()
//    var pack: PackTestManager = PackTestManager()
//    var article: ArticleTestManager = ArticleTestManager()
//    var land: LandTestManager = LandTestManager()
//    var life: LifeTestManager = LifeTestManager()
//    var scribble: ScribbleTestManager = ScribbleTestManager()
//    var fight: FightTestManager = FightTestManager()
//    var spinner: SpinnerTestManager = SpinnerTestManager()
//    
//    
//    func getAll(packId: UUID) {
//        pack.getData(packId: packId)
//        land.getData(packId: packId, name: pack.currentLand)
//        life.getData(packId: packId)
//        scribble.getData(scribbleId: land.scribbleId)
//        spinner.getData(landId: land.id, name: land.name)
//    }
//    
//    func saveAll() {
//        pack.updateData()
//        land.updateData()
//        life.updateData()
//        scribble.updateData()
//        spinner.updateData()
//    }
//    
//}
//    
