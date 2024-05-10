//
//  ScribbleWorldsApp.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 5/8/24.
//

import SwiftUI

@main

struct ScribbleWorldsApp: App {
    @Environment(\.scenePhase) private var scenePhase
   
    var body: some Scene {
        
        WindowGroup {
            IntroView()
                .equatable()
                .statusBar(hidden: true)
        }
        
//        .onChange(of: scenePhase) { phase in
//            if phase == .background {
//                let _ = print("In ScribbleWorldsApp... background")
//            }
//            if phase == .inactive {
//                let _ = print("In ScribbleWorldsApp... inactive")
//                       // Save here
//            }
//            if phase == .active {
//                let _ = print("In ScribbleWorldsApp... active")
//                       // Save here
//            }
//        }
    }
    
}
