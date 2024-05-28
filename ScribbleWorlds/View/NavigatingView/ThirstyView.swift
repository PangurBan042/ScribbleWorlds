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
            VStack {
                Image("protagonistThirsty")
                    .resizable()
                    .scaledToFit()
                    .frame(width: radius/2)
                
                Text("Out of water, lose a heart!")
                    .font(.custom("Chalkduster", size: 16))
                    .lineLimit(4)
                    .minimumScaleFactor(0.3)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .frame(alignment: .center)
               
            }
              
           
        }
        .frame(width:radius, height:radius, alignment: .center)
        .onAppear(perform: {
            radius = min(viewManager.spinnerView.spinner.width, viewManager.spinnerView.spinner.height) / 1.8
        })
    }
}
