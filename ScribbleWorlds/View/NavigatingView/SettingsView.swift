//
//  SettingsView.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 5/4/23.
//

//import Foundation
//import SwiftUI
//
//struct SettingsView: View {
//    
//    @ObservedObject var viewManager: ViewManager
//    @ObservedObject var settingsViewModel: SettingsViewModel
//    @State var autofill: String = "None"
//    @State var showCharacter: Bool = true
//    
//    var color = #colorLiteral(red: 0.3412033021, green: 0.3035173118, blue: 0.2637621462, alpha: 1)
//    var backgroundColor = #colorLiteral(red: 0.8627451062, green: 0.8627452254, blue: 0.8670507073, alpha: 1)
//    var autoFillOptions = ["Off", "Trace", "Color"]
//    var showCharacterOptions = ["On", "Off"]
//    
//    
//    var body: some View {
//        
//        let _ = print("!!!In SettingsView!!!")
//        
//        VStack (alignment: .center, spacing: 0) {
//            
//            Text("Settings")
//                .lineLimit(1)
//                .minimumScaleFactor(0.5)
//                .font(Font.custom("WalterTurncoat-Regular", size:UIScreen.main.bounds.width * 0.08, relativeTo: .title))
//                .frame(width:viewManager.gridView.grid.frameDim,
//                       height:viewManager.gridView.grid.frameDim * 0.20)
//                .foregroundColor(Color(color))
//                .background(.quaternary)
//                .background(Color.white)
//                .opacity(1.0)
//            
//            
//            List {
//                
//                HStack {
//                    
//                    Text("AutoFill")
//                        .lineLimit(1)
//                        .minimumScaleFactor(0.5)
//                        .font(Font.custom("WalterTurncoat-Regular", size:viewManager.gridView.grid.frameDim * 0.08, relativeTo: .title))
//                        .foregroundColor(Color(color))
//                    
//                    Menu {
//                        Picker(selection: $autofill) {
//                            ForEach(autoFillOptions, id: \.self) { value in
//                                Text(value)
//                                
//                            }
//                        } label: {}
//                    } label: {
//                        Text(settingsViewModel.autofill)
//                            .lineLimit(1)
//                            .minimumScaleFactor(0.5)
//                            .font(Font.custom("WalterTurncoat-Regular", size:UIScreen.main.bounds.width * 0.04, relativeTo: .title))
//                            .frame(width:viewManager.gridView.grid.frameDim * 0.50,
//                                   height:viewManager.gridView.grid.frameDim * 0.20, alignment: .trailing)
//                            .foregroundColor(Color(color))
//                        
//                        
//                    }
//                }
//                .frame(width:viewManager.gridView.grid.frameDim * 0.80,
//                       height:viewManager.gridView.grid.frameDim * 0.10, alignment: .leading)
//                
//                Toggle("ShowCharacter", isOn: $showCharacter)
//                    .tint(Color(color))
//                    .lineLimit(1)
//                    .minimumScaleFactor(0.5)
//                    .font(Font.custom("WalterTurncoat-Regular", size:viewManager.gridView.grid.frameDim * 0.08, relativeTo: .title))
//                    .frame(width:viewManager.gridView.grid.frameDim * 0.80,
//                           height:viewManager.gridView.grid.frameDim * 0.10, alignment: .leading)
//                    .foregroundColor(Color(color))
//                
//                
//                
//            }
//            .background(Color.white)
//            .opacity(0.70)
//        }
//        .onAppear {
//            autofill = settingsViewModel.autofill
//            showCharacter = settingsViewModel.showCharacter
//            if settingsViewModel.autofill != "Off" {
//                settingsViewModel.showCharacter = true
//            }
//            if !settingsViewModel.showCharacter {
//                settingsViewModel.autofill = "Off"
//            }
//        }
//        .onChange(of: autofill) {
//            settingsViewModel.autofill = autofill
//            if settingsViewModel.autofill != "Off" {
//                settingsViewModel.showCharacter = true
//            }
//        }
//        .onChange(of: showCharacter) {
//            settingsViewModel.showCharacter = showCharacter
//            if !settingsViewModel.showCharacter {
//                settingsViewModel.autofill = "Off"
//            }
//            if settingsViewModel.showCharacter && settingsViewModel.autofill == "Off" {
//                settingsViewModel.autofill = "Color"
//            }
//        }
//       
//        .frame(width:viewManager.gridView.grid.frameDim, height:viewManager.gridView.grid.frameDim)
//        .border(.gray)
//        
//        
//    }
//}
//
