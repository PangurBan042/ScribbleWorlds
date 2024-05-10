//
//  LootView.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 10/17/22.
//

//import Foundation
//import SwiftUI
//
//struct SpinForLootView: View {
//    @ObservedObject var viewManager: ViewManager
//    @ObservedObject var landViewModel: LandViewModel
//    @ObservedObject var articleViewModel: ArticleViewModel
//    @ObservedObject var fightViewModel: FightViewModel
//    @Binding var updateViewModel: UpdateViewModel
//   
//    var body: some View {
//        let _ = print("!!!In SpinForLootView!!!")
//        
//        VStack {
//            
//            /// You are fighting name space
//            VStack {
//                Text("Congratulations on defeating: ")
//                    .scaledFont(name: "WalterTurncoat-Regular", size: 28)
//                    .multilineTextAlignment(.center)
//            
//                Text(fightViewModel.name)
//                    .scaledFont(name: "WalterTurncoat-Regular", size: 40)
//                    .multilineTextAlignment(.center)
//                
//                Image(articleViewModel.name)
//                    .resizable()
//                    .scaledToFit()
//                Text("For your bravery and courage, we bestow upon you:")
//                    .scaledFont(name: "WalterTurncoat-Regular", size: 28)
//                    .multilineTextAlignment(.center)
//                Text("\(articleViewModel.name) : ")
//                    .scaledFont(name: "WalterTurncoat-Regular", size: 28)
//                    .multilineTextAlignment(.center)
//                Text(articleViewModel.info)
//                    .scaledFont(name: "WalterTurncoat-Regular", size: 28)
//                    .multilineTextAlignment(.center)
//                
//                Text("")
//                    .scaledFont(name: "WalterTurncoat-Regular", size: 28)
//                    .multilineTextAlignment(.center)
//                
//                
//                Button {
//                    landViewModel.currentTab = landViewModel.name + " Loot"
//                    landViewModel.spinnerBackground = "Loot"
//                    landViewModel.spinForLootOn.toggle()
//                    
//                }   label: {
//                Text("Tap me and spin to get one additional item!")
//                    .scaledFont(name: "WalterTurncoat-Regular", size: 40)
//                    .multilineTextAlignment(.center)
//                }
//            }
//            .frame(width:viewManager.fightView.name.width, height:viewManager.fightView.name.height)
//        }
//        .frame(width:viewManager.fightView.majorFightAndTitle.width, height:viewManager.fightView.majorFightAndTitle.height)
//        .background(Color.white)
//        
//    }
//}
//
