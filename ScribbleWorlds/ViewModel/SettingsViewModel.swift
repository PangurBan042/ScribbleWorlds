//
//  SettingsManager.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 5/4/23.
//

import Foundation


public class SettingsViewModel: ObservableObject {
    
    
    
    var id: UUID = UUID()
    @Published var packId: UUID = UUID()
    @Published var autofill: String = "None"
    @Published var showCharacter: Bool = true
   
    
    deinit {
        print("TabManager is deinitialized")
    }
    
    init(packId: UUID) {
        getData(packId: packId)
    }
    
    
    func getData(packId:UUID) {
            let settingsData =  CoreDataManager.instance.getSettings(packId:packId)
            id = settingsData.id
            autofill = settingsData.autofill
            showCharacter = settingsData.showCharacter
    }
    
}
