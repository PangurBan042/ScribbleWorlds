//
//  Fight.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 10/5/22.
//

import Foundation


struct Fight: Identifiable {
    
    public var id: UUID = UUID()
    public var landId: UUID = UUID()
    public var name: String = ""
    public var nextFight: String = ""
    public var info: String = ""
    public var article: String = ""
    public var level: Int = Int()
    public var attackPoints: Int = 0
    public var defensePoints: Int = 0
    public var attackPointsForOneBattle: Int = 0
    public var defensePointsForOneBattle: Int = 0
    public var on: [Bool] = []
    public var count: Int = 0
    public var isDead: Bool = false
    public var showSpinForLootView: Bool = false
    public var showDefeatedView: Bool = false
    public var showDuelView: Bool = false
    
}
