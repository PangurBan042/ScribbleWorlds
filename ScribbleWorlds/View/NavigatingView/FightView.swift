//
//  FightView.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 10/5/22.
//

import Foundation
import SwiftUI

struct FightView: View {
    
    
    @ObservedObject var viewManager: ViewManager
    @ObservedObject var landViewModel: LandViewModel
    @ObservedObject var articleViewModel: ArticleViewModel
    @ObservedObject var fightViewModel: FightViewModel
    @Binding var updateViewModel: UpdateViewModel
    
    @State var fights = [Fight()]
    @State var land = ""
    @State var numberOfCols = 0
    @State var showDefeatedView: Bool = false
    
    var body: some View {
        
        let minWidth = viewManager.fightView.minorFightImage.width/Double(numberOfCols+1)
        let _ = print("!!!FightView!!!")
        
        VStack(spacing:0) {
            
            /// Top padding
            Text("")
                .frame(width:viewManager.fightView.padding.width, height:viewManager.fightView.padding.height)
            
            
            VStack {
                /// You are fighting name space
                VStack {
                    Text("You are fighting: ")
                        .scaledFont(name: "WalterTurncoat-Regular", size: 28)
                        .multilineTextAlignment(.center)
                    HStack(spacing:0) {
                        
                        Text(fightViewModel.name)
                            .scaledFont(name: "WalterTurncoat-Regular", size: 40)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                            .frame(width:20)
                        
                        Text("\(fightViewModel.attackPoints) ")
                            .scaledFont(name: "Chalkduster", size: 15)
                            .frame(width:viewManager.spinnerView.stats.pointsWidth, height: viewManager.spinnerView.stats.levelNameHeight)
                            .background(
                                Image("Enemy Attack None")
                                    .resizable()
                                    .scaledToFill()
                                    .foregroundColor(.gray)
                            )
                        
                        Text("\(fightViewModel.defensePoints)")
                            .scaledFont(name: "Chalkduster", size: 15)
                            .frame(width:viewManager.spinnerView.stats.pointsWidth, height: viewManager.spinnerView.stats.levelNameHeight)
                            .background(
                                Image("Enemy Defense None")
                                    .resizable()
                                    .scaledToFill()
                                    .foregroundColor(.gray)
                            )
                        
                    }
                }
                .frame(width:viewManager.fightView.name.width, height:viewManager.fightView.name.height)
                
                
                ///  Padding between name space and monster info
                Text("")
                    .frame(width:viewManager.fightView.padding.width, height:viewManager.fightView.padding.height)
                
                
                
                HStack (spacing: 0)
                {
                    Image(fightViewModel.name)
                        .resizable()
                        .scaledToFit()
                        .frame(width:viewManager.fightView.majorFightImage.width, height:viewManager.fightView.majorFightImage.height)
//                        .offset(x: xoffset, y: yoffset)
//                        .animateForever (autoreverses: true) {
//                            xoffset = 0
//                            yoffset = 0
//                        }
                    
                    
                    VStack (alignment: .leading, spacing: 0){
                        
                        Text("")
                            .frame(width:viewManager.fightView.majorFightPadding.width, height:viewManager.fightView.majorFightPadding.height)
                        
                        HStack (spacing: 0){
                            
                            ForEach(0..<min(fightViewModel.on.count,6), id: \.self) { index in
                                
                                    Image(fightViewModel.on[index] ? "Heart Filled" : "Heart Empty")
                                        .resizable()
                                        .scaledToFit()
                            }
                        }
                        .frame(width:viewManager.fightView.majorFightLife.width, height:viewManager.fightView.majorFightLife.height/2)
                        
                        
                        if fightViewModel.on.count > 6 {
                            
                            HStack (spacing: 0) {
                                
                                ForEach(6..<fightViewModel.on.count, id: \.self) { index in
                                    
                                        Image(fightViewModel.on[index] ? "Heart Filled" : "Heart Empty")
                                            .resizable()
                                            .scaledToFit()
                                    
                                }
                            }
                            .frame(width:viewManager.fightView.majorFightLife.width, height:viewManager.fightView.majorFightLife.height/2)
                            Spacer()
                        }
                        
                        Text(fightViewModel.info)
                            .scaledFont(name: "WalterTurncoat-Regular", size: 20)
                            .multilineTextAlignment(.center)
                            .frame(width:viewManager.fightView.majorFightInfo.width, height:viewManager.fightView.majorFightInfo.height)
                        Spacer()
                        
                    }
                    .frame(width:viewManager.fightView.majorFightData.width, height:viewManager.fightView.majorFightData.height/2)
                    
                }
                .frame(width:viewManager.fightView.majorFight.width, height:viewManager.fightView.majorFight.height)
            }
            .frame(width:viewManager.fightView.majorFightAndTitle.width, height:viewManager.fightView.majorFightAndTitle.height)
            
            .overlay(fightViewModel.showSpinForLootView  ? SpinForLootView(viewManager: viewManager, landViewModel: landViewModel, articleViewModel: articleViewModel, fightViewModel: fightViewModel, updateViewModel: $updateViewModel) : nil)
            .overlay(fightViewModel.showDefeatedView ? DefeatedView(viewManager: viewManager,land: $landViewModel.name) : nil)
            
            
            
            
            
            
            Text("")
                .frame(width:viewManager.fightView.padding.width, height:viewManager.fightView.padding.height)
            
            
            
            LabelledDivider(label: landViewModel.fightHeading)
                .scaledFont(name: "WalterTurncoat-Regular", size: 22)
                .frame(width:viewManager.fightView.minorFightHeading.width, height:viewManager.fightView.minorFightHeading.height)
            
            
            
            HStack (alignment:.center, spacing: 0)
            {
                Spacer()
                ForEach(0..<numberOfCols, id: \.self) {index in
                    MinorMonsterView(viewManager: viewManager, minWidth: minWidth, fights: fights, index: index)
                }
            }
            .frame(width:viewManager.fightView.minorFight.width, height:viewManager.fightView.minorFight.height/2)
            
            
            
            HStack (alignment:.center, spacing: 0)
            {
                Spacer()
                ForEach(numberOfCols..<fights.count, id: \.self) {index in
                    MinorMonsterView(viewManager: viewManager, minWidth: minWidth, fights: fights, index: index)
                }
            }
            .frame(width:viewManager.fightView.minorFight.width, height:viewManager.fightView.minorFight.height/2)
            
            
            
        }
        .onAppear(perform: {
            updateFight()
        })
        .onChange(of:fightViewModel.name) {
            updateFight()
        }
        .onChange(of:fightViewModel.isDead) {
            updateFight()
        }
       .frame(width:viewManager.fightView.width, height:viewManager.fightView.height)
        .border(.gray)
        .opacity(1.0)
        .background(Color.white)
    }
    
    func updateFight() {
        fights = fightViewModel.getAllData(landId: landViewModel.id)
        
        //Calculate how many monsters per row
        numberOfCols = fights.count / 2
        if fights.count % 2 == 1 {
            numberOfCols += 1
        }
        
//        showDefeatedView  = false
//        land = landViewModel.name
//        if landViewModel.spinForLootOn && fightViewModel.nextFight == "Defeated" {
//            showDefeatedView  = true
//        }
    }
}



struct LabelledDivider: View {
    
    let label: String
    let horizontalPadding: CGFloat
    let color: Color
    
    init(label: String, horizontalPadding: CGFloat = 20, color: Color = .gray) {
        self.label = label
        self.horizontalPadding = horizontalPadding
        self.color = color
    }
    
    var body: some View {
        HStack {
            line
            Text(label).foregroundColor(color)
            line
        }
    }
    
    var line: some View {
        VStack { Divider().background(color) }.padding(horizontalPadding)
    }
}


struct MinorMonsterView: View {
    
    var viewManager: ViewManager
    var minWidth: Double
    var fights: [Fight]
    var index: Int
    
    var body: some View {
        
        VStack (alignment:.center, spacing: 0) {
            
            Spacer()
            
            Image(fights[index].name)
                .resizable()
                .scaledToFit()
                .opacity(fights[index].isDead ? 0.5 : 1.0)
                .frame(width:minWidth)
                .overlay( fights[index].isDead ? Image("Crossbones")
                    .resizable()
                    .scaledToFit() : nil)
            
            
            Text(fights[index].name)
                .scaledFont(name: "WalterTurncoat-Regular", size: 14)
                .frame(width:minWidth, height:viewManager.fightView.minorFightName.height/2)
                .multilineTextAlignment(.center)
            
        }
        .frame(width:minWidth, height:viewManager.fightView.minorFight.height/2)
        
        Spacer()
    }
}


struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String
    var size: Double
    
    func body(content: Content) -> some View {
        let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        return content.font(.custom(name, size: scaledSize))
    }
}

@available(iOS 13, macCatalyst 13, tvOS 13, watchOS 6, *)
extension View {
    func scaledFont(name: String, size: Double) -> some View {
        return self.modifier(ScaledFont(name: name, size: size))
    }
}


extension View {
    func animateForever(using animation: Animation = .spring(response: 0.5, dampingFraction: 0.0, blendDuration: 0.5), autoreverses: Bool = false, _ action: @escaping () -> Void) -> some View {
        let repeated = animation.repeatForever(autoreverses: autoreverses)
        
        return onAppear {
            withAnimation(repeated) {
                action()
            }
        }
    }
}
