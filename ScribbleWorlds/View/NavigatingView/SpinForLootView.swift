//
//  LootView.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 10/17/22.
//

import Foundation
import SwiftUI

struct SpinForLootView: View {
    @ObservedObject var viewManager: ViewManager
    @ObservedObject var landViewModel: LandViewModel
    @ObservedObject var articleViewModel: ArticleViewModel
    @ObservedObject var fightViewModel: FightViewModel
    @Binding var updateViewModel: UpdateViewModel
    @State var showArticleInfo: Bool = false
    @State var article = Article()
   
    var body: some View {
        let _ = print("!!!In SpinForLootView!!!")
        let _ = print("In SpinForLootView... articleViewModle.name: \(articleViewModel.name)")
        
        ZStack {
            Rectangle()
                .foregroundColor(.white)
            
            Image("Crossbones")
                    .resizable()
                    .scaledToFit()
                    .opacity(0.05)
            
            VStack {
                
                /// You are fighting name space
                VStack {
                    Text("Congratulations on defeating: ")
                        .scaledFont(name: "WalterTurncoat-Regular", size: 28)
                        .multilineTextAlignment(.center)
                        .frame(width:viewManager.spinForLootView.congrats.width, height: viewManager.spinForLootView.congrats.height)
                    
                    //                Image(fightViewModel.name)
                    //                    .resizable()
                    //                    .scaledToFit()
                    //                    .frame(width:viewManager.spinForLootView.fightImage.width, height:viewManager.spinForLootView.fightImage.height * 0.5)
                    //                    .border(.gray)
                    
                    Text(fightViewModel.name)
                        .scaledFont(name: "WalterTurncoat-Regular", size: 28)
                        .multilineTextAlignment(.center)
                        .frame(width:viewManager.spinForLootView.fightName.width, height: viewManager.spinForLootView.fightName.height)
                    
                    Text("For your bravery and courage, we bestow upon you:")
                        .scaledFont(name: "WalterTurncoat-Regular", size: 28)
                        .multilineTextAlignment(.center)
                        .frame(width:viewManager.spinForLootView.bestowItem.width, height: viewManager.spinForLootView.bestowItem.height)
                    
                    Image(articleViewModel.name)
                        .resizable()
                        .scaledToFit()
                        .frame(width:viewManager.spinForLootView.itemImage.width, height: viewManager.spinForLootView.itemImage.height)
                    
                    
                    Text("\(articleViewModel.name): ")
                        .scaledFont(name: "WalterTurncoat-Regular", size: 28)
                        .multilineTextAlignment(.center)
                        .frame(width:viewManager.spinForLootView.itemName.width, height: viewManager.spinForLootView.itemName.height)
                    
                    
                    Text("\(articleViewModel.info)")
                        .scaledFont(name: "WalterTurncoat-Regular", size: 20)
                        .multilineTextAlignment(.center)
                        .frame(width:viewManager.spinForLootView.itemInfo.width, height: viewManager.spinForLootView.itemInfo.height)
                    
                    Spacer()
                    
                    Button {
                        landViewModel.currentTab = landViewModel.name + " Loot"
                        landViewModel.spinnerBackground = "Loot"
                        landViewModel.updateData()
                        landViewModel.spinForLootOn.toggle()
                        updateViewModel.updateTab.toggle()
                    }   label: {
                        Text("Tap me and spin for one additional item!")
                            .scaledFont(name: "WalterTurncoat-Regular", size: 28)
                            .multilineTextAlignment(.center)
                            .frame(width:viewManager.spinForLootView.tapAndSpin.width, height: viewManager.spinForLootView.tapAndSpin.height)
                    }
                    
                }
            }
        }
        .frame(width:viewManager.spinForLootView.width, height:viewManager.spinForLootView.height)
        
        
    }
}
