//
//  DeadView.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 12/15/23.
//

import SwiftUI

struct DeadView: View {
    @ObservedObject var viewManager: ViewManager
    @Binding var updateViewModel: UpdateViewModel
    @Binding var characterIsDead: Bool
    
    let color = #colorLiteral(red: 0.9981341958, green: 0.579616487, blue: 0, alpha: 1)
    
    
    var body: some View {
        
        ZStack(alignment: .center){
            
            Rectangle()
                .strokeBorder(.white, lineWidth:2)
                .background(Rectangle().fill(.white))
                .opacity(1.0)
            VStack {
                
                Image("protagonistDead")
                    .resizable()
                    .scaledToFit()
                    .frame(width: viewManager.deadView.finalImage.width, height: viewManager.deadView.finalImage.height )
                    
                
                Text("After many valient battles and braving the elements, you have succombed to your injuries.  On your headstone, it is written, 'Oh brave knight lays here thus mightly.'")
                    .scaledFont(name: "WalterTurncoat-Regular", size: 20)
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .frame(width: viewManager.deadView.finalText.width, height: viewManager.deadView.finalText.height )
                
                Text("")
                
                Button ("I'm not ready to be vanquished!!!"){
                    updateViewModel.updateHeartsToTrue.toggle()
                    updateViewModel.updateWatersToTrue.toggle()
                    characterIsDead = false
                }
                .scaledFont(name: "WalterTurncoat-Regular", size: 40)
                .multilineTextAlignment(.center)
                .buttonStyle(.borderedProminent)
                .tint(Color(color))
                .frame(width: viewManager.deadView.finalButton.width, height: viewManager.deadView.finalButton.height )
             
            }
           
        }
        .frame(width:viewManager.gridView.grid.frameDim, height:viewManager.gridView.grid.frameDim)
        .border(.gray)
        
        
    }
       
    
}

