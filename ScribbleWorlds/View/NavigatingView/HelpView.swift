//  HelpView.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 9/30/22.
//

import Foundation
import SwiftUI

struct HelpView: View {
    
    @ObservedObject var viewManager: ViewManager
    var helpPages: [String]
    
    
    
    var body: some View {
        
        let _ = print("!!!In HelpView!!!")
        
        VStack (spacing: 0) {
           
                TabView(){
                    ForEach(helpPages, id: \.self) { helpPage in
                        
                        Image(helpPage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: viewManager.gridView.grid.frameDim, height: viewManager.gridView.grid.frameDim)
                            
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
        .frame(width:viewManager.gridView.grid.frameDim, height:viewManager.gridView.grid.frameDim)
        .background(Color.white)
        .border(.gray)
        .opacity(1.0)
    }
}
