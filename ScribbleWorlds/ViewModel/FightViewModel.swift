//
//  FightViewModel.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 4/15/24.
//

import Foundation


public class FightViewModel: ObservableObject {
    
    @Published var fight = Fight()
    
    deinit {
        print("FightManager is deinitialized")
    }

    public var id: UUID {
        get { return fight.id }
    }
    
    public var landId: UUID {
        get { return fight.landId }
    }
    
    public var name: String {
        get { return fight.name }
    }
    
    public var nextFight: String {
        get { return fight.nextFight }
       
    }
    
    public var info: String {
        get { return fight.info }
    }
    
    public var isDead: Bool {
        get { return fight.isDead}
        set { fight.isDead = newValue
            CoreDataManager.instance.updateIsDead(fight:fight)
        }
    }
    
    public var article: String {
        get { return fight.article }
    }
    
    public var level: Int {
        get { return fight.level }
    }
    
    public var attackPoints: Int {
        get { return fight.attackPoints }
    }
    
    public var defensePoints: Int {
        get { return fight.defensePoints }
    }
    
    public var on: [Bool] {
        get { return fight.on }
        set {
            fight.on = newValue
            CoreDataManager.instance.updateFightOn(fight:fight)
            //updateIsDead()
        }
    }
    
    public var count: Int {
        get { return fight.count }
        set {
            fight.count = newValue
            CoreDataManager.instance.updateFightCount(fight:fight)
        }
    }
        
    public var showSpinForLootView: Bool {
        get { return fight.showSpinForLootView }
        set { fight.showSpinForLootView = newValue
            CoreDataManager.instance.updateFightShowSpinForLootView(fight:fight)
            
        }
    }
        
    public var showDefeatedView: Bool {
        get { return fight.showDefeatedView }
        set { fight.showDefeatedView = newValue
            CoreDataManager.instance.updateFightShowDefeatedView(fight:fight)
        }
    }
    
    public var showDuelView: Bool {
        get { return fight.showDuelView }
        set { fight.showDuelView = newValue
            CoreDataManager.instance.updateFightShowDuelView(fight:fight)
        }
    }

    
    func getData(landId:UUID, name:String) {
        let _ = print("WTF")
        let _ = print("In FightViewModel/getData... name: \(name)")
        if name != "Defeated" {
            let fightData =  CoreDataManager.instance.getFight(landId: landId, name:name)
            fight.id = fightData.id
            fight.landId = fightData.landId
            fight.info = fightData.info
            fight.name = fightData.name
            fight.nextFight = fightData.nextFight
            fight.info = fightData.info
            fight.article = fightData.article
            fight.level = fightData.level
            fight.attackPoints = fightData.attackPoints
            fight.defensePoints = fightData.defensePoints
            fight.on = fightData.on
            fight.count = fightData.count
            fight.isDead = fightData.isDead
            fight.showDefeatedView = fightData.showDefeatedView
            fight.showSpinForLootView = fightData.showSpinForLootView
            fight.showDuelView = fightData.showDuelView
        }
    }
  
    func getAllData(landId:UUID) -> [Fight] {
        return  CoreDataManager.instance.getAllFights(landId: landId)
    }
}
