//
//
//  NavigateViewAdventure.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 9/29/22.
//

import Foundation
import SwiftUI

struct NavigateViewAdventure: View {
    
    @ObservedObject var viewManager: ViewManager
    @ObservedObject var landViewModel: LandViewModel
    @ObservedObject var navigateViewModel: NavigateViewModel
    @ObservedObject var heartsViewModel: HeartsViewModel
    @ObservedObject var waterViewModel: WaterViewModel
    @Binding var updateViewModel: UpdateViewModel
    @Binding var currentLand: String
    @Binding var activeSheet: ActiveSheet?
    @Binding var takeSnapshot: Bool
    @Binding var shareSnapshot: Bool
    @Binding var showDrawing: Bool
    
   

    
    
    @StateObject var lifeViewModel: LifeViewModel = LifeViewModel()
    @State var image = UIImage()
    @State var oldLand: String = ""
   // @State var water: [Bool] = []
    
    init(viewManager:ViewManager,
         landViewModel: LandViewModel,
         navigateViewModel: NavigateViewModel,
         heartsViewModel: HeartsViewModel,
         waterViewModel: WaterViewModel,
         updateViewModel: Binding<UpdateViewModel>,
         currentLand: Binding<String>,
         activeSheet: Binding<ActiveSheet?>,
         takeSnapshot: Binding<Bool>,
         shareSnapshot: Binding<Bool>,
         showDrawing: Binding<Bool>) {
        self.viewManager = viewManager
        self.landViewModel = landViewModel
        self.navigateViewModel = navigateViewModel
        self.heartsViewModel = heartsViewModel
        self.waterViewModel = waterViewModel
        self._updateViewModel = updateViewModel
        self._currentLand = currentLand
        self._activeSheet = activeSheet
        self._takeSnapshot = takeSnapshot
        self._shareSnapshot = shareSnapshot
        self._showDrawing = showDrawing
        
        
       // _lifeViewModel = StateObject(wrappedValue: { LifeViewModel(packId:landViewModel.packId) }())
    }


    
    var body: some View {
        let _ = print("!!!In NavigateViewAdventure!!!")
        
        HStack(alignment:.center, spacing:0) {
            
            Button {
                landViewModel.readInfo = true
                navigateViewModel.menuSelection = ""
                currentLand = landViewModel.priorLand
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(.gray)
                    .font(Font.title.weight(.bold))
            }
            .frame(width:viewManager.navigateView.leftArrow.width, height: viewManager.navigateView.leftArrow.height)
            .hidden(isEmpty(data:landViewModel.priorLand))
            
            // BackPack Button
            Button {
                if !landViewModel.readInfo {
                    landViewModel.readInfo = true
                }
                if navigateViewModel.menuSelection == "Backpack" {
                    navigateViewModel.menuSelection = ""
                } else {
                    navigateViewModel.menuSelection = "Backpack"
                }
               
            } label: {
                Image("Backpack")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .if (updateViewModel.animateBackpack) { view in
                            view.shadow(color: .red, radius: 10, x: 0.0, y: 0.0)
                    }
                
            }.frame(width:viewManager.navigateView.backpack.width, height: viewManager.navigateView.backpack.height)
            
            //Icon Padding
            Text("")
                .frame(width: viewManager.navigateView.iconPadding.width, height: viewManager.navigateView.iconPadding.height)
            
            // Book Button
            Button {
                if !landViewModel.readInfo {
                    landViewModel.readInfo = true
                } else {
                    if navigateViewModel.menuSelection == "Book" {
                        navigateViewModel.menuSelection = ""
                    } else {
                        navigateViewModel.menuSelection = "Book"
                    }
                }

                
            } label: {
                Image("Notebook")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
            }.frame(width:viewManager.navigateView.book.width, height: viewManager.navigateView.book.height)
            
            //Icon Padding
            Text("")
                .frame(width: viewManager.navigateView.iconPadding.width, height: viewManager.navigateView.iconPadding.height)
            
            Button {
                if !landViewModel.readInfo {
                    landViewModel.readInfo = true
                    
                }
                if navigateViewModel.menuSelection == "Help" {
                    navigateViewModel.menuSelection = ""
                } else {
                    navigateViewModel.menuSelection = "Help"
                }
            } label: {
                Image("Help Icon")
                    .resizable()
                    .scaledToFit()
                    
            }.frame(width:viewManager.navigateView.help.width, height: viewManager.navigateView.help.height)
               
            
            // Stats Padding
            Text("")
                .frame(width: viewManager.navigateView.beforeStatsPadding.width, height: viewManager.navigateView.beforeStatsPadding.height)
            
            
            // Stats Buttons
            if lifeViewModel.packId == landViewModel.packId {
           
                VStack {
                    HeartsView(viewManager: viewManager, heartsViewModel: heartsViewModel, updateViewModel: $updateViewModel)

                    WaterView(viewManager: viewManager,         waterViewModel: waterViewModel, updateViewModel: $updateViewModel)
                
                }
                .frame(width:viewManager.navigateView.stats.width, height:viewManager.navigateView.stats.height)
            }
            
                // Stats Padding
                Text("")
                    .frame(width: viewManager.navigateView.afterStatsPadding.width, height: viewManager.navigateView.afterStatsPadding.height)
                
                Button {
                        if landViewModel.currentTab.contains("Loot") ||
                            landViewModel.currentTab.contains("Fight") ||
                            navigateViewModel.menuSelection.contains("Book") ||
                            navigateViewModel.menuSelection.contains("Backpack") ||
                            navigateViewModel.menuSelection.contains("Help") {
                            showDrawing = false } else { showDrawing = true }
                        
                        takeSnapshot.toggle()
                        shareSnapshot.toggle()
                    landViewModel.updateData()
                    navigateViewModel.updateData()
                    
                } label: {
                    Image("Share Icon")
                        .resizable()
                        .scaledToFit()
                }
                .frame(width:viewManager.navigateView.share.width, height: viewManager.navigateView.share.height)
                    
    
                
                //Icon Padding
                Text("")
                    .frame(width: viewManager.navigateView.iconPadding.width, height: viewManager.navigateView.iconPadding.height)
                
                Button {
                    if !landViewModel.readInfo {
                        landViewModel.readInfo = true
                    
                    }
                    if navigateViewModel.menuSelection == "Settings" {
                        navigateViewModel.menuSelection = ""
                        showDrawing = true
                    } else {
                        navigateViewModel.menuSelection = "Settings"
                        showDrawing = false
                    }
                } label: {
                    Image("Gear")
                        .resizable()
                        .scaledToFit()
                        
                }.frame(width:viewManager.navigateView.help.width, height: viewManager.navigateView.help.height)
                   
                
                //Icon Padding
                Text("")
                    .frame(width: viewManager.navigateView.iconPadding.width, height: viewManager.navigateView.iconPadding.height)
                //Home Icon
                Button {
                    if landViewModel.currentTab.contains("Loot") ||
                        landViewModel.currentTab.contains("Fight") ||
                        navigateViewModel.menuSelection.contains("Book") ||
                        navigateViewModel.menuSelection.contains("Backpack") ||
                        navigateViewModel.menuSelection.contains("Help") {
                        showDrawing = false } else { showDrawing = true }
                    updateViewModel.updateWedge.toggle()
                    let _ = print("In NavigateView/HomeIcon")
                    navigateViewModel.updateData()
                    takeSnapshot = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2)  {
                    activeSheet = Optional.none
                        UIView.setAnimationsEnabled(false)
                    }
                   
                } label: {
                    Image("Home Icon")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                }.frame(width:viewManager.navigateView.gear.width, height: viewManager.navigateView.gear.height)
                
                
            
                Button {
                    landViewModel.readInfo = true
                    navigateViewModel.menuSelection = ""
                    currentLand = landViewModel.afterLand
                } label: {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                        .font(Font.title.weight(.bold))
                }
                .frame(width: viewManager.navigateView.rightArrow.width, height: viewManager.navigateView.rightArrow.height)
                .hidden(isEmpty(data:landViewModel.afterLand))
                    
                
                
            }
                
        .frame(width: viewManager.navigateView.width, height: viewManager.navigateView.height)
        .onAppear(perform: {
            lifeViewModel.getData(packId: landViewModel.packId)
            lifeViewModel.heartCount = 2
            lifeViewModel.heart = [true,true,false,false,false,false, false, false, false, false]
            
        })
        .onChange(of:updateViewModel.resetTempOverlay) {
            if navigateViewModel.menuSelection != "" {
                navigateViewModel.menuSelection = ""
            }
        }
//        .onBackground {
//            canvasManager.saveCanvasDataToCanvasObject()
//            scribbleManager.saveData()
//            getSnapshot = true
//        }
        
        
    } // End of body view
   
   
    
    
} // End of ScribbleWorldsGoalView

func isEmpty(data:String) -> Bool {
    if data == "" {
        return true
    } else {
        return false
    }
        
}

extension View {
    func hidden(_ shouldHide: Bool) -> some View {
        opacity(shouldHide ? 0 : 1)
    }
}

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

extension View {
    
    func onBackground(_ f: @escaping () -> Void) -> some View {
        self.onReceive(
            NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification),
            perform: { _ in f() }
        )
    }
    
    func onForeground(_ f: @escaping () -> Void) -> some View {
        self.onReceive(
            NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification),
            perform: { _ in f() }
        )
    }
}

struct HeartsView: View {
    
    @ObservedObject var viewManager: ViewManager
    @ObservedObject var heartsViewModel: HeartsViewModel
    @Binding var updateViewModel: UpdateViewModel
    
    
    var body: some View {
        let _ = print("!!!In HeartView!!!")
        
        
        HStack {
            ForEach(0...heartsViewModel.on.count-1, id: \.self) { index in
                
                Image(heartsViewModel.on[index] ? "Heart Filled" : "Heart Empty")
                    .resizable()
                    .scaledToFit()
            }
        }
        .onChange(of: updateViewModel.waterLossOfHeart) {
            if let heartIndex = heartsViewModel.on.lastIndex(of:true) {
                heartsViewModel.on[heartIndex].toggle()
                updateViewModel.animateThirsty = true
            }
            if !heartsViewModel.on.allSatisfy({$0 == false}) {
                updateViewModel.updateWatersToTrue.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    updateViewModel.animateThirsty = false
                }
            } else {
                updateViewModel.isDead = true
            }
        }
        .onChange(of: updateViewModel.updateHeartsToTrue) {
            heartsViewModel.on =  heartsViewModel.on.map { _ in true }
        }
        
        .frame(width:viewManager.navigateView.stats.width,
               height: viewManager.navigateView.stats.height/2)
        
    }
}
    
 

struct WaterView: View {
    
    @ObservedObject var viewManager: ViewManager
    @ObservedObject var waterViewModel: WaterViewModel
    @Binding var updateViewModel: UpdateViewModel
    
    var body: some View {
        let _ = print("!!!In WaterView!!!")
        
            HStack {
                ForEach(0...waterViewModel.count-1, id: \.self) { index in
                    Button {
                        waterViewModel.on[index].toggle()
                        if waterViewModel.on.allSatisfy({$0 == false}){
                            updateViewModel.waterLossOfHeart.toggle()

                        }
                    } label: {
                        Image(waterViewModel.on[index] ? "Drop Filled" : "Drop Empty")
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
            .frame(width:viewManager.navigateView.stats.width,
                   height: viewManager.navigateView.stats.height/2)
            .onChange(of:updateViewModel.updateWatersToTrue) {
                waterViewModel.on =  waterViewModel.on.map { _ in true }
            }
    }
}
