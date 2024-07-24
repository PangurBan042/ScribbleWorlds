//
//  StatsView.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 12/1/22.
//

import SwiftUI

struct StatsView: View {
    
    @ObservedObject var viewManager: ViewManager
    @ObservedObject var infoViewModel: InfoViewModel
    @Binding var updateViewModel: UpdateViewModel
    let color = #colorLiteral(red: 0.8991737962, green: 0.9104933739, blue: 0.910294354, alpha: 1)
    
    
    var body: some View {
        
        let _ = print("!!!In StatsView!2!!")
        
        ZStack(alignment: .top) {
            
            
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(color), lineWidth: 4)
                .frame(width: viewManager.spinnerView.stats.width, height:viewManager.spinnerView.stats.height)
                .background(.white)
                .opacity(0.5)
            
            
            VStack(spacing:0) {
                LevelandPointsView(viewManager: viewManager,
                                   infoViewModel: infoViewModel)
                    
                Spacer()
               
                WeildingView(viewManager: viewManager,
                             infoViewModel: infoViewModel)
                
                ShieldView(viewManager: viewManager,
                           infoViewModel: infoViewModel)
                    
                ArmorView(viewManager: viewManager,
                          infoViewModel: infoViewModel)
                    
                HelmView(viewManager: viewManager,
                         infoViewModel: infoViewModel)
                
            
                
            }
        }
        .frame(width: viewManager.spinnerView.stats.width, height:viewManager.spinnerView.stats.height)
        .onChange(of: updateViewModel.resetPointsAfterOneBattle) {
            infoViewModel.attackPointsForOneBattle = 0
            infoViewModel.defensePointsForOneBattle = 0
        }
      
    }
}



struct LevelandPointsView: View {
    
    @ObservedObject var viewManager: ViewManager
    @ObservedObject var infoViewModel: InfoViewModel
   
    
    var body: some View {
        
        VStack(spacing:0){
            Text("")
                .frame(width:viewManager.spinnerView.stats.width, height: viewManager.spinnerView.stats.rowPadding/2)
            
            HStack(spacing:0) {
                
                
                Text("")
                    .frame(width:viewManager.spinnerView.stats.columnPadding, height: viewManager.spinnerView.stats.levelNameHeight)
                
                VStack(spacing:0) {
                    
                    Spacer()
                    Text("Level  \(infoViewModel.level + 1):")
                        .frame(width:viewManager.spinnerView.stats.levelNameWidth, height: viewManager.spinnerView.stats.toolTypeHeight,
                               alignment:.leading)
                        .scaledFont(name: "Chalkduster", size: 20)
                    
                    Text(infoViewModel.allLevels[infoViewModel.level])
                        .frame(width:viewManager.spinnerView.stats.levelNameWidth, height: viewManager.spinnerView.stats.toolTypeHeight, alignment: .leading)
                        .scaledFont(name: "Chalkduster", size: 20)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.leading)
                        .minimumScaleFactor(0.1)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    
                }
                .frame(width:viewManager.spinnerView.stats.levelNameWidth, height:viewManager.spinnerView.stats.toolNameHeight + viewManager.spinnerView.stats.toolTypeHeight)
                
                Text("")
                    .frame(width:viewManager.spinnerView.stats.columnPadding, height: viewManager.spinnerView.stats.levelNameHeight)
                
                
                Text("\(infoViewModel.attackPoints + infoViewModel.level + infoViewModel.attackPointsForOneBattle)")
                    .scaledFont(name: "Chalkduster", size: 15)
                    .frame(width:viewManager.spinnerView.stats.pointsWidth, height: viewManager.spinnerView.stats.levelNameHeight)
                    .background(
                        Image("Attack Points None")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.gray)
                    )
                Text("\(infoViewModel.defensePoints + infoViewModel.defensePointsForOneBattle)")
                    .scaledFont(name: "Chalkduster", size: 15)
                    .frame(width:viewManager.spinnerView.stats.pointsWidth, height: viewManager.spinnerView.stats.levelNameHeight)
                    .background(
                        Image("Defense Points None")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.gray)
                    )
                
                Text("")
                    .frame(width:viewManager.spinnerView.stats.columnPadding, height: viewManager.spinnerView.stats.levelNameHeight)
                
                Spacer()
            }
        }
        .frame(width:viewManager.spinnerView.stats.width, height:viewManager.spinnerView.stats.levelNameHeight + viewManager.spinnerView.stats.rowPadding)
    }
}

struct WeildingView: View {
    
    @ObservedObject var viewManager: ViewManager
    @ObservedObject var infoViewModel: InfoViewModel
    
    var body: some View {
        
        VStack(spacing:0){
            
            Text("")
                .frame(width:viewManager.spinnerView.stats.width, height: viewManager.spinnerView.stats.rowPadding/2)
            
            HStack(alignment:.top, spacing:0) {
                
                Text("")
                    .frame(width:viewManager.spinnerView.stats.columnPadding, height: viewManager.spinnerView.stats.levelNameHeight)
                
                VStack(spacing:0) {
                    Spacer()
                    
                    Text("Wielding")
                        .frame(width:viewManager.spinnerView.stats.levelNameWidth, height: viewManager.spinnerView.stats.toolTypeHeight, alignment: .leading)
                        .foregroundColor(.gray)
                        .underline(color:.gray)
                        
                        
                    
                    Text(infoViewModel.weaponName.isEmpty ? "Knuckle Sandwich (+0)" : (infoViewModel.weaponName + " (+\(infoViewModel.weaponValue)") + ")")
                        .frame(width:viewManager.spinnerView.stats.levelNameWidth, height: viewManager.spinnerView.stats.toolTypeHeight, alignment: .leading)
                        .scaledFont(name: "Chalkduster", size: 15)
                        .multilineTextAlignment(.leading)
                        .minimumScaleFactor(0.1)
                        .lineLimit(1)
                    Spacer()
                   
                }
                .frame(width:viewManager.spinnerView.stats.levelNameWidth, height:viewManager.spinnerView.stats.toolNameHeight + viewManager.spinnerView.stats.toolTypeHeight)
                
                Text("")
                    .frame(width:viewManager.spinnerView.stats.columnPadding, height: viewManager.spinnerView.stats.levelNameHeight)
                
                
                Image(infoViewModel.weaponName.isEmpty ? "Knuckle Sandwich" : infoViewModel.weaponName)
                    .resizable()
                    .scaledToFit()
                    .frame(width:viewManager.spinnerView.stats.pointsWidth * 2, height:viewManager.spinnerView.stats.toolImageHeight)
                
                
                Text("")
                    .frame(width:viewManager.spinnerView.stats.columnPadding, height: viewManager.spinnerView.stats.levelNameHeight)
                
                Spacer()
            }
            
            Text("")
                .frame(width:viewManager.spinnerView.stats.width, height: viewManager.spinnerView.stats.rowPadding/2)
        }
        .frame(width:viewManager.spinnerView.stats.width, height:viewManager.spinnerView.stats.levelNameHeight  + viewManager.spinnerView.stats.rowPadding)
       
    }
}

struct ShieldView: View {
    
    @ObservedObject var viewManager: ViewManager
    @ObservedObject var infoViewModel: InfoViewModel
    
    var body: some View {
        
        VStack(spacing:0){
            
            Text("")
                .frame(width:viewManager.spinnerView.stats.width, height: viewManager.spinnerView.stats.rowPadding/2)
            
            HStack(alignment:.top, spacing:0) {
                
                Text("")
                    .frame(width:viewManager.spinnerView.stats.columnPadding, height:  viewManager.spinnerView.stats.levelNameHeight)
                
                VStack(spacing:0) {
                    Spacer()
                    
                    Text("Shield")
                        .frame(width:viewManager.spinnerView.stats.levelNameWidth, height: viewManager.spinnerView.stats.toolTypeHeight, alignment: .leading)
                        .foregroundColor(.gray)
                        .underline(color: .gray)
                        .scaledFont(name: "Chalkduster", size: 15)
                    
                    
                    Text(infoViewModel.shieldName.isEmpty ? "Leaf Shield (+0)" : (infoViewModel.shieldName + " (+\(infoViewModel.shieldValue)") + ")")
                        .frame(width:viewManager.spinnerView.stats.levelNameWidth, height: viewManager.spinnerView.stats.toolTypeHeight, alignment: .leading)
                        .scaledFont(name: "Chalkduster", size: 15)
                        .multilineTextAlignment(.leading)
                        .minimumScaleFactor(0.1)
                        .lineLimit(1)
                    
                    Spacer()
                    
                }
                .frame(width:viewManager.spinnerView.stats.levelNameWidth, height:viewManager.spinnerView.stats.toolNameHeight + viewManager.spinnerView.stats.toolTypeHeight)
                
                Text("")
                    .frame(width:viewManager.spinnerView.stats.columnPadding, height: viewManager.spinnerView.stats.levelNameHeight)
                
                
                
                Image(infoViewModel.shieldName.isEmpty ? "Leaf Shield" : infoViewModel.shieldName)
                    .resizable()
                    .scaledToFit()
                    .frame(width:viewManager.spinnerView.stats.pointsWidth * 2, height:viewManager.spinnerView.stats.toolImageHeight)
                
                
                
                Text("")
                    .frame(width:viewManager.spinnerView.stats.columnPadding, height: viewManager.spinnerView.stats.levelNameHeight)
                
                Spacer()
            }
            Text("")
                .frame(width:viewManager.spinnerView.stats.width, height: viewManager.spinnerView.stats.rowPadding/2)
        }
        .frame(width:viewManager.spinnerView.stats.width, height:viewManager.spinnerView.stats.levelNameHeight + viewManager.spinnerView.stats.rowPadding)
        
    }
}

struct ArmorView: View {
    
    @ObservedObject var viewManager: ViewManager
    @ObservedObject var infoViewModel: InfoViewModel
    
    var body: some View {
        
        VStack(spacing:0){
            Text("")
                .frame(width:viewManager.spinnerView.stats.width, height: viewManager.spinnerView.stats.rowPadding/2)
            
            HStack(alignment:.top, spacing:0) {
                
                Text("")
                    .frame(width:viewManager.spinnerView.stats.columnPadding, height:  viewManager.spinnerView.stats.levelNameHeight)
                
                VStack(spacing:0) {
                    Spacer()
                    
                    Text("Armor")
                        .frame(width:viewManager.spinnerView.stats.levelNameWidth, height: viewManager.spinnerView.stats.toolTypeHeight, alignment: .leading)
                        .foregroundColor(.gray)
                        .underline(color: .gray)
                        .scaledFont(name: "Chalkduster", size: 15)
                    
                    
                    Text(infoViewModel.armorName.isEmpty ? "Adventure Rags (+0)" : (infoViewModel.armorName + " (+\(infoViewModel.armorValue)") + ")")
                        .frame(width:viewManager.spinnerView.stats.levelNameWidth, height: viewManager.spinnerView.stats.toolTypeHeight, alignment: .leading)
                        .scaledFont(name: "Chalkduster", size: 15)
                        .multilineTextAlignment(.leading)
                        .minimumScaleFactor(0.1)
                        .lineLimit(1)
                    
                    Spacer()
                    
                }
                .frame(width:viewManager.spinnerView.stats.levelNameWidth, height:viewManager.spinnerView.stats.toolNameHeight + viewManager.spinnerView.stats.toolTypeHeight)
                
                Text("")
                    .frame(width:viewManager.spinnerView.stats.columnPadding, height: viewManager.spinnerView.stats.levelNameHeight)
                
                
                
                Image(infoViewModel.armorName.isEmpty ? "Adventure Rags" : infoViewModel.armorName)
                    .resizable()
                    .scaledToFit()
                    .frame(width:viewManager.spinnerView.stats.pointsWidth * 2, height:viewManager.spinnerView.stats.toolImageHeight)
                
                
                
                Text("")
                    .frame(width:viewManager.spinnerView.stats.columnPadding, height: viewManager.spinnerView.stats.levelNameHeight)
                
                Spacer()
            }
            Text("")
                .frame(width:viewManager.spinnerView.stats.width, height: viewManager.spinnerView.stats.rowPadding/2)
        }
        .frame(width:viewManager.spinnerView.stats.width, height:viewManager.spinnerView.stats.levelNameHeight + viewManager.spinnerView.stats.rowPadding)
        
    }
}

struct HelmView: View {
    
    @ObservedObject var viewManager: ViewManager
    @ObservedObject var infoViewModel: InfoViewModel
    
    var body: some View {
        
        VStack(spacing:0){
            
            Text("")
                .frame(width:viewManager.spinnerView.stats.width, height: viewManager.spinnerView.stats.rowPadding/2)
            
            HStack(alignment:.top, spacing:0) {
                
                Text("")
                    .frame(width:viewManager.spinnerView.stats.columnPadding, height:  viewManager.spinnerView.stats.levelNameHeight)
                
                VStack(spacing:0) {
                    Spacer()
                    
                    Text("Helmet")
                        .frame(width:viewManager.spinnerView.stats.levelNameWidth, height: viewManager.spinnerView.stats.toolTypeHeight, alignment: .leading)
                        .foregroundColor(.gray)
                        .underline(color: .gray)
                        .scaledFont(name: "Chalkduster", size: 15)
                    
                    
                    Text(infoViewModel.helmName.isEmpty ? "Amazing Haircut (+0)" : (infoViewModel.helmName + " (+\(infoViewModel.helmValue)") + ")")
                         
                        .frame(width:viewManager.spinnerView.stats.levelNameWidth, height: viewManager.spinnerView.stats.toolTypeHeight, alignment: .leading)
                        .scaledFont(name: "Chalkduster", size: 15)
                        .multilineTextAlignment(.leading)
                        .minimumScaleFactor(0.1)
                        .lineLimit(1)
                    
                    Spacer()
                    
                }
                .frame(width:viewManager.spinnerView.stats.levelNameWidth, height:viewManager.spinnerView.stats.toolNameHeight + viewManager.spinnerView.stats.toolTypeHeight)
                
                Text("")
                    .frame(width:viewManager.spinnerView.stats.columnPadding, height: viewManager.spinnerView.stats.levelNameHeight)
                
                
                
                Image(infoViewModel.helmName.isEmpty ? "Amazing Haircut" : infoViewModel.helmName)
                    .resizable()
                    .scaledToFit()
                    .frame(width:viewManager.spinnerView.stats.pointsWidth * 2, height:viewManager.spinnerView.stats.toolImageHeight)
                
                
                
                Text("")
                    .frame(width:viewManager.spinnerView.stats.columnPadding, height: viewManager.spinnerView.stats.levelNameHeight)
                
                Spacer()
            }
           
            Text("")
                .frame(width:viewManager.spinnerView.stats.width, height: viewManager.spinnerView.stats.rowPadding/2)
            
        }
        .frame(width:viewManager.spinnerView.stats.width, height:viewManager.spinnerView.stats.levelNameHeight  + viewManager.spinnerView.stats.rowPadding)
       
    }
}
