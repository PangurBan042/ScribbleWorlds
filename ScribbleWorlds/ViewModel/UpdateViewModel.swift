//
//  UpdateViewModel.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 3/29/24.
//

import SwiftUI

struct UpdateViewModel {
    
    struct UpdateInfo {
        var now: Bool = false
        var level: Bool = false
        var on: Bool = false
        var category: String = ""
        var name: String = ""
        var value: Int = 0
        
    }
    
    struct Health {
        var now: Bool = false
        var hearts: [Bool] = []
        var count: Int = 0
        var tempCount: Int = 0
    }
    
    var shareSnapshot: Bool = false
    var takeSnapshot: Bool = false
    var heartsCount: Int = 0
    var waterCount: Int = 0
    var waterLossOfHeart: Bool = false
    var animateThirsty: Bool = false
    var animateBackpack: Bool = false
    var showBackpack: Bool = false
    var showSpinForLoot: Bool = false
    var isDead: Bool = false
    var resetTempOverlay: Bool = false
    var updateBackpack: Bool = false
    var updateWedgeForHome: Bool = false
    var updateWedgeForShare: Bool = false
    var updateInfo: UpdateInfo = UpdateInfo()
    var updateTab: Bool = false
    var health: Health = Health()
    var updateHeartsToTrue: Bool = false
    var updateWatersToTrue: Bool = false
    var spinnerSavedTakeSnapshot: Bool = false
    var spinnerSavedShareSnapshot: Bool = false
    var characterIsDead: Bool = false
    var resetPointsAfterOneBattle: Bool = false
   
}
