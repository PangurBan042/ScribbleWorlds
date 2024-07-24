//
//  ScribbleView.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 3/26/21//

import SwiftUI
import PencilKit
import Spinner

struct ScribbleView: View {
    
    @ObservedObject public var viewManager: ViewManager
    @Binding public var updateViewModel: UpdateViewModel
    @ObservedObject public var canvasViewModel: CanvasViewModel
    @ObservedObject var landViewModel: LandViewModel
    @ObservedObject var articleViewModel: ArticleViewModel
    @ObservedObject var navigateViewModel: NavigateViewModel
    @ObservedObject var heartsViewModel: HeartsViewModel
    @ObservedObject var waterViewModel: WaterViewModel
    @ObservedObject var infoViewModel: InfoViewModel
    @ObservedObject var fightViewModel: FightViewModel
    var dataViewModel: DataViewModel
    @Binding var characterIsDead: Bool
    var helpPages: [String]
    
    @State var nodesX: [Int] = []
    @State var nodesY: [Int] = []
    @State var nodeNames: [String] = []
    @State var mainNodes: Nodes = Nodes()
    @State var bigNodes: [String:Nodes] = [:]
    @State var placingElement = true
    @StateObject var scribbleViewModel: ScribbleViewModel
    @StateObject var settingsViewModel: SettingsViewModel
    
    init(viewManager: ViewManager,
         updateViewModel: Binding<UpdateViewModel>,
         canvasViewModel: CanvasViewModel,
         landViewModel: LandViewModel,
         articleViewModel: ArticleViewModel,
         navigateViewModel: NavigateViewModel,
         heartsViewModel: HeartsViewModel,
         waterViewModel: WaterViewModel,
         infoViewModel: InfoViewModel,
         fightViewModel: FightViewModel,
         dataViewModel: DataViewModel,
         characterIsDead: Binding<Bool>,
         helpPages: [String]) {
        self.viewManager = viewManager
        self._updateViewModel = updateViewModel
        self.canvasViewModel = canvasViewModel
        self.landViewModel = landViewModel
        self.articleViewModel = articleViewModel
        self.navigateViewModel = navigateViewModel
        self.heartsViewModel = heartsViewModel
        self.waterViewModel = waterViewModel
        self.infoViewModel = infoViewModel
        self.fightViewModel = fightViewModel
        self.dataViewModel = dataViewModel
        self._characterIsDead = characterIsDead
        self.helpPages = helpPages
        
        _scribbleViewModel = StateObject(wrappedValue: { ScribbleViewModel(scribbleId: landViewModel.scribbleId) }())
        
        _settingsViewModel = StateObject(wrappedValue: { SettingsViewModel(packId: landViewModel.packId) }())
    }
    
    var body: some View {
        
        let _ = print("!!!In ScribbleView!!!")
        
        let squareSize = viewManager.gridView.grid.frameDim / Double(scribbleViewModel.gridSize)
     
        let scribbleCanvasView = ScribbleCanvasView(
                                    viewManager: viewManager,
                                    scribbleViewModel: scribbleViewModel,
                                    canvasViewModel: canvasViewModel,
                                    settingsViewModel: settingsViewModel,
                                    squareSize: squareSize)
        
        
        ZStack (alignment: .center){
     
            if scribbleViewModel.id == landViewModel.scribbleId {
                /// Displays Grid
                
                scribbleCanvasView
                    .frame(width:viewManager.gridView.grid.frameDim, height:viewManager.gridView.grid.frameDim)
                    
                
                settingsViewModel.showCharacter ? YouAreHereView(viewManager:viewManager,
                                   scribbleViewModel: scribbleViewModel,
                                   mainNodes: $mainNodes,
                                   bigNodes: $bigNodes,
                                   squareSize: squareSize) : nil
                
                    
             
            }
        }
        .onChange(of: "\(landViewModel.id)") {
            scribbleViewModel.updateData()
            scribbleViewModel.getData(scribbleId: landViewModel.scribbleId)
            settingsViewModel.getData(packId: landViewModel.packId)
        }
       .overlay(landViewModel.currentTab == "Fight"  ? FightView(viewManager: viewManager, landViewModel: landViewModel, articleViewModel: articleViewModel, fightViewModel: fightViewModel,  updateViewModel: $updateViewModel) : nil)
       .overlay(navigateViewModel.menuSelection == "Backpack" || landViewModel.currentTab == "Loot" ? BackpackView(viewManager:viewManager, landViewModel: landViewModel, articleViewModel: articleViewModel, heartsViewModel: heartsViewModel, waterViewModel: waterViewModel, infoViewModel: infoViewModel,  fightViewModel: fightViewModel, dataViewModel: dataViewModel, updateViewModel: $updateViewModel) : nil)
        .overlay(navigateViewModel.menuSelection == "Book" ? BookView(viewManager: viewManager, landViewModel: landViewModel) : nil)
        .overlay(!landViewModel.readInfo ? ReadIntroView(viewManager: viewManager, landViewModel: landViewModel) : nil)
        .overlay(navigateViewModel.menuSelection == "Settings" ? SettingsView(viewManager: viewManager, settingsViewModel: settingsViewModel) : nil)
        .overlay(navigateViewModel.menuSelection == "Help" ? HelpView(viewManager: viewManager, helpPages: helpPages) : nil)
        .overlay(updateViewModel.characterIsDead ?  DeadView(viewManager: viewManager, updateViewModel: $updateViewModel) : nil)
        

//        .onChange(of: updateManager.autoFill)  {
//            autoFill = update.autoFill
//        }
//        .onChange(of:latestSpin) {
//            let _ = print("In ScribbleView... currentTabSpun: \(dataManager.land.currentTabSpun)")
//                if
//                    dataManager.land.autoPlaceNames.contains(dataManager.land.currentTab) && dataManager.land.currentTabSpun && updateManager.autoFill != "Off" {
//                    DispatchQueue.main.asyncAfter(deadline: latestSpin) {
//                        
//                        //
//                        placingElement = true
//                        
//                        //Go through all the mainNodes
//                        for index in 0...mainNodes.x.count-1 {
//                            
//                            //If the main node is empty and standard icon
//                            if dataManager.scribble.elements[mainNodes.y[index]][mainNodes.x[index]] == "" && placingElement && wedgeName != "New Biome" && !wedgeName.contains("Big") {
//
//                                        dataManager.scribble.setElement(row:mainNodes.y[index], col: mainNodes.x[index], value:wedgeName)
//                                        placingElement = false
//
//                                
//                            }
//                            //If the main node is empty and large icon
//                            if dataManager.scribble.elements[mainNodes.y[index]][mainNodes.x[index]] == "" && placingElement && wedgeName != "New Biome" && wedgeName.contains("Big") {
//                                let currentNodeName = mainNodes.names[index]
//
//                                for bigIndex in 0...(bigNodes[currentNodeName]!.names.count - 1) {
//                                    
//                                    let col = bigNodes[currentNodeName]!.x[bigIndex]
//                                    let row = bigNodes[currentNodeName]!.y[bigIndex]
//                                    
//                                    let name =
//                                        bigNodes[currentNodeName]!.names[bigIndex]
//                                    
//                                    if dataManager.scribble.elements[row][col] == "" {
//                                        dataManager.scribble.setElement(row:row, col: col, value:wedgeName + " \(name)")
//
//                                    }
//                                    placingElement = false
//                                }
//                            }
//                        }
//                    }
//                }
//
//        }
        
//        .onChange(of: dataManager.land.currentTab, perform: { _ in
//            if dataManager.land.currentTab.contains("Loot") && navigateManager.isBackpack {
//                navigateManager.isBackpack = true
//            }
//        })
        .frame(width:viewManager.gridView.grid.frameDim,height:viewManager.gridView.grid.frameDim)
           
        
    }
    
   

}
   






struct ColorSquare: View {
   
    let dim: Double
    
    var body: some View {
        Color.clear
        .frame(width:dim , height: dim)
        .padding(0)
        .border(.gray)
        .opacity(0.5)
    }
}

struct ScribbleCanvasView: View {
    @ObservedObject public var viewManager: ViewManager
    @ObservedObject var scribbleViewModel: ScribbleViewModel
    @ObservedObject var canvasViewModel: CanvasViewModel
    @ObservedObject var settingsViewModel: SettingsViewModel
    
   
    var squareSize: Double

   
    
    
    var body: some View {

        
        Grid (alignment: .center, horizontalSpacing: 0, verticalSpacing: 0){

                ForEach(0..<scribbleViewModel.gridSize, id:\.self) { row in
                    GridRow {
                       ForEach(0..<scribbleViewModel.gridSize, id:\.self) { col in
                           let element = scribbleViewModel.elements[row][col]
                                 ZStack {
                                    ColorSquare(dim:squareSize)
                                    
                                    (element.contains("Big")) ?
                                    Image(element)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width:squareSize * 0.95, height:squareSize * 0.95)
                                        .grayscale( settingsViewModel.autofill == "Trace" ? 1.0 : 0.0)
                                        .opacity ( settingsViewModel.autofill == "Trace" ? 0.2 : 1.0) :
                                    
                                    Image(element)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width:squareSize * 0.75, height:squareSize * 0.75)
                                        .grayscale( settingsViewModel.autofill == "Trace" ? 1.0 : 0.0)
                                        .opacity ( settingsViewModel.autofill == "Trace" ? 0.2 : 1.0)
                                }
                        }
                    }
                }
            }
        .background(Image(scribbleViewModel.background + " Grid")
            .resizable()
            .scaledToFit()
            .frame(width: viewManager.gridView.grid.frameDim, height: viewManager.gridView.grid.frameDim))
        DrawingCanvasView(canvasViewModel: canvasViewModel)
            .frame(width:viewManager.gridView.grid.frameDim, height:viewManager.gridView.grid.frameDim)
        
    }
}



struct Nodes {
    var x: [Int] = []
    var y: [Int] = []
    var names: [String] = []
}
