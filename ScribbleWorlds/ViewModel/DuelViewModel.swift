//
//  DuelViewModel.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 4/12/24.
//

import Foundation

public class DuelViewModel: ObservableObject {
    
    var id: UUID = UUID()
    var landId: UUID = UUID()
    @Published var enemyHearts: Int = 0
    @Published var characterHearts: Int = 0
    @Published var fightName: String = ""
    @Published var showDuelView: Bool = false
    deinit {
        print("DuelViewModel is deinitialized")
    }
    
    func getData(landId:UUID) {
        let duelData =  CoreDataManager.instance.getDuel(landId: landId)
        id = duelData.id
        self.landId = duelData.landId
        enemyHearts = duelData.enemyHearts
        characterHearts = duelData.characterHearts
        fightName = duelData.fightName
        showDuelView = duelData.showDuelView
    }
    
    func updateData() {
        CoreDataManager.instance.updateDuel(id: id,
                            enemyHearts: enemyHearts,
                            characterHearts: characterHearts,
                            fightName: fightName,
                            showDuelView: showDuelView)
    }
}
