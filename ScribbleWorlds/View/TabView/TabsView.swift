//
//  TabView.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 3/26/21.
//

import SwiftUI
import Spinner

struct TabsView: View {

    @ObservedObject var viewManager: ViewManager
    @ObservedObject var tabViewModel: TabViewModel
    
    @State var height: Double = 0
    var body: some View {
        let _ = print("!!!In TabsView!!!")
        let heightOffsets = viewManager.calculateTabHeights(numberOfTabs: tabViewModel.spinnerImageNames.count)
        let widthOffset = -1 * (viewManager.spinnerView.width/2 - viewManager.spinnerView.tab.widthPerTab/2)
       
        
        VStack(spacing:0) {
            if tabViewModel.spinnerImageNames.count > 1 || tabViewModel.spinnerImageNames[0] == "" {
                ForEach(0 ..< tabViewModel.spinnerImageNames.count, id: \.self) { index in
                    
                    ZStack () {
                        
                        if tabViewModel.name != tabViewModel.spinnerNames[index] {
                            Button(action: {
                                tabViewModel.name = tabViewModel.spinnerNames[index]
                               
                                tabViewModel.backgroundName = tabViewModel.spinnerImageNames[index]
                                tabViewModel.updateData()
                                
                            }) {
                                let uiImage = downsample(imageName: tabViewModel.spinnerImageNames[index] + " Tab", to: (CGSize(width: viewManager.spinnerView.width, height: viewManager.spinnerView.height)))
                                if let image = uiImage {
                                    Image(uiImage: image)
                                        .resizable()
                                        .frame(width:viewManager.spinnerView.width, height:viewManager.spinnerView.height)
                                        .offset(x: widthOffset, y:heightOffsets[index])
                                        .overlay(Text("\(tabViewModel.spinnerImageNames[index])"))
                                        .scaledFont(name: "Chalkduster", size: 20)
                                        .foregroundColor(Color.black)
                                        .ignoresSafeArea()
                                }
                                
                                
                            }
                            
                            .frame(width: viewManager.spinnerView.tab.widthPerTab,  height:viewManager.spinnerView.tab.heightPerTab)
                            .background(Color.white)
                            .contentShape(Rectangle())
                            .clipped()
                            .shadow(color: .gray, radius: 1)
                            
                            
                        }
                        
                        else {
                            Text("\(tabViewModel.spinnerImageNames[index])")
                                .scaledFont(name: "Chalkduster", size: 20)
                                .foregroundColor(Color.black)
                                .frame(width: viewManager.spinnerView.tab.widthPerTab, height: viewManager.spinnerView.tab.heightPerTab)
                        } /// End of If
                        
                    } /// End of ZStack
                
                }///
                
            }  /// End of ForEach
            
        } /// End of VStack
        ///
    }
}


func convertImage (name:String) -> UIImage {
    return UIImage(named: name) ?? UIImage()
}
