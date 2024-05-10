//
//  DefeatedView.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 1/18/23.
//

//import Foundation
//import SwiftUI
//
//struct DefeatedView: View {
//    
//    @ObservedObject var viewManager: ViewManager
//    @Binding var land: String
//   
//    
//    
//    var body: some View {
//        
//        let _ = print("!!!In DefeatedView!!!")
//        
//        VStack {
//            
//            /// You are fighting name space
//            VStack {
//                Text("You defeated the \(land) ")
//                    .scaledFont(name: "WalterTurncoat-Regular", size: 28)
//                    .multilineTextAlignment(.center)
//
//            }
//            .frame(width:viewManager.fightView.name.width, height:viewManager.fightView.name.height)
//        }
//        .frame(width:viewManager.fightView.majorFightAndTitle.width, height:viewManager.fightView.majorFightAndTitle.height)
//        .background(Color.white)
//        
//    }
//}
//
