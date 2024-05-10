//
//  AboutView.swift
//  ScribbleWorlds 1.1
//
//  Created by Franny Moyse on 6/13/22.
//

import SwiftUI

struct AboutView: View {
    @Binding var activeSheet: ActiveSheet?
    var pages = ["About Page 1 Small", "About Page 2 Small"]
    var color = #colorLiteral(red: 0.3412033021, green: 0.3035173118, blue: 0.2637621462, alpha: 1)
    
    
    var body: some View {
        
        let _ = print("!!!In AboutView!!!")
        
        HStack {
            
            Button {
                
                activeSheet = Optional.none
            } label: {
                
                Image(systemName: "arrow.backward")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color(color))
            }
            .frame(width:UIScreen.main.bounds.width * 0.10, height:UIScreen.main.bounds.height * 0.015)
            
            Text("         About         ")
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .font(Font.custom("WalterTurncoat-Regular", size:UIScreen.main.bounds.width * 0.10, relativeTo: .largeTitle))
                .frame(width:UIScreen.main.bounds.width * 0.80,
                       height:UIScreen.main.bounds.height * 0.10)
                
            
            Text("")
                .frame(width:UIScreen.main.bounds.width * 0.10)
                
        }
        .foregroundColor(Color(color))
        .background(.quaternary)
        .frame(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.10)
        
        TabView(){
            ForEach(pages, id: \.self) { page in
              
                    Image(page)
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.825)
                
            }
        }
        .statusBar(hidden: true)
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}



