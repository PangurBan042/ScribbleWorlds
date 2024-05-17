//
//  DuelView.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 12/15/23.
//

import SwiftUI
import Spinner

struct DuelView: View {
    
    @ObservedObject var viewManager: ViewManager
    @ObservedObject var duelViewModel: DuelViewModel
    
    @State var radius: Double = 0.0
    
    var body: some View {
        
        ZStack(alignment: .center){
            
            Circle()
                .strokeBorder(.white, lineWidth:2)
                .background(Circle().fill(.white))
                .opacity(1.0)
            
            VStack(alignment: .center) {
                
                Spacer()
                
                HStack() {
                    Image("Protagonist")
                        .resizable()
                        .scaledToFit()
                        .frame(width: radius * 1/6, height: radius * 1/6)
                    
                    Text("")
                    
                    Text("vs")
                        .scaledToFit()
                        .frame(width: radius * 1/0, height: radius * 1/0)
                    
                    Text("")
                    
                    Image(duelViewModel.fightName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: radius * 1/6, height: radius * 1/6)
                    
                }
                .frame(width: radius)
                
                if duelViewModel.showDuelView {
                    HStack(spacing: 0) {
                        
                        Image("Protagonist")
                            .resizable()
                            .scaledToFit()
                            .frame(width: radius * 1/6, height: radius * 1/6)
                        
                        Text("\(duelViewModel.characterHearts)")
                            .foregroundColor(.white)
                            .scaledFont(name: "Chalkduster", size: 15)
                            .frame(width:radius * 1/6, height: radius * 1/6)
                            .background(
                                Image("Heart Filled")
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.gray)
                            )
                    }
                    
                    HStack(spacing: 0) {
                        
                        Image(duelViewModel.fightName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: radius * 1/6, height: radius * 1/6)
                        
                        Text("\(duelViewModel.enemyHearts)")
                            .foregroundColor(.white)
                            .scaledFont(name: "Chalkduster", size: 15)
                            .frame(width:radius * 1/6, height: radius * 1/6)
                            .background(
                                Image("Heart Filled")
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.gray)
                            )
                    }
                }
                
                Spacer()
            }
            
        }
        .frame(width:radius, height:radius, alignment: .center)
        .onAppear() {
            radius = min(viewManager.spinnerView.spinner.width, viewManager.spinnerView.spinner.height) / 1.7
        }
    }
}
