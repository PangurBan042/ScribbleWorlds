//
//  ThirstyView.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 12/15/23.
//

import SwiftUI

struct ThirstyView: View {
   
    @ObservedObject var viewManager: ViewManager
    
    @State var radius: Double = 0.0
    @State var specialRadius: Double = 0.0
    
    var body: some View {
        
        ZStack(alignment: .center){
            
            Circle()
                .strokeBorder(.white, lineWidth:2)
                .background(Circle().fill(.white))
                .opacity(1.0)
            
            Text("YOU RAN OUT OF WATER, LOSE A HEART")
                .font(.title)
                .frame(width: radius/2)
              
           
        }
        .frame(width:radius, height:radius, alignment: .center)
        .border(.gray)
        .onAppear(perform: {
            radius = min(viewManager.spinnerView.spinner.width, viewManager.spinnerView.spinner.height) / 1.8
        })
    }
}
