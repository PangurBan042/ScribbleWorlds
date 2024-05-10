//
//  ReadIntroView.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 3/15/24.
//

import SwiftUI


struct ReadIntroView: View {
    
    @ObservedObject var viewManager: ViewManager
    @ObservedObject var landViewModel: LandViewModel
    
    
    var body: some View {
        
        ZStack(alignment: .top) {
            BookView(viewManager: viewManager, landViewModel: landViewModel)
            HStack(alignment: .top) {
                Spacer()
                Button {
                    landViewModel.readInfo = true
                    landViewModel.updateReadInfo()
                } label: {
                    Image(systemName: "xmark.circle")
                        .padding(10)
                        .foregroundColor(.black)
                }
            }
        }
    }
}
