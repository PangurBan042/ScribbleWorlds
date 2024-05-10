//
//  BookView.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 9/30/22.
//

//import Foundation
//import SwiftUI
//
//struct BookView: View {
//   
//    @ObservedObject var viewManager: ViewManager
//    @ObservedObject var landViewModel: LandViewModel
//   
//    var body: some View {
//        
//        let _ = print("!!!In BookView!!!")
//        
//        VStack (spacing: 0) {
//          
//                TabView() {
//                    
//                    ForEach(landViewModel.questPages, id: \.self) { questPage in
//                       
//                        
//                        
//                        Image(questPage)
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: viewManager.gridView.grid.frameDim, height: viewManager.gridView.grid.frameDim)
//                        
//                    }
//                }
//                .tabViewStyle(PageTabViewStyle())
//                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
//        }
//        .frame(width:viewManager.gridView.grid.frameDim, height:viewManager.gridView.grid.frameDim)
//        .background(Color.white)
//        .border(.gray)
//        .opacity(1.0)
//    }
//}
//    
//    
//    
//    
//    
//    
//    
//    
//    
//
//    
