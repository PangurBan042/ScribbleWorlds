//
//  YouAreHereView.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 4/26/23.
//
//
import Foundation
import SwiftUI

struct YouAreHereView: View {
    
    @ObservedObject public var viewManager: ViewManager
    @ObservedObject public var scribbleViewModel: ScribbleViewModel
    @Binding var mainNodes: Nodes
    @Binding var bigNodes: [String:Nodes]
    var squareSize: Double
    @State var gridX: Int = 0
    @State var gridY: Int = 0
    @State var x: CGFloat = 0.0
    @State var y: CGFloat = 0.0
    
    
    
    var youAreHereGesture: some Gesture {
        
        DragGesture()
            .onChanged { gesture in
                x = gesture.location.x
                y = gesture.location.y
            }
            .onEnded { _ in
                if x >= 0 && x < viewManager.gridView.grid.frameDim &&  y >= 0 && y < viewManager.gridView.grid.frameDim {
                    
                    scribbleViewModel.youAreHereX = x/squareSize
                    scribbleViewModel.youAreHereY = y/squareSize
                    scribbleViewModel.updateData()
                    gridX = Int(scribbleViewModel.youAreHereX)
                    gridY = Int(scribbleViewModel.youAreHereY)
                    createAvailableGrid()
                    
                }
                
                
                //For snapping to center of grid square.
                x = CGFloat(gridX) * squareSize + squareSize/2
                y = CGFloat(gridY) * squareSize + squareSize/2
            }
    }
    
    
    var body: some View {
        
        let _ = print("!!!In YouAreHereView!!!")
        
        ZStack {
            
            Image("Protagonist")
                .resizable()
                .scaledToFit()
                .frame(width:squareSize * 0.75, height:squareSize * 0.75)
                .position(x:x, y: y)
            
        }
        .gesture(youAreHereGesture)
        .onAppear(perform: {
            x = scribbleViewModel.youAreHereX * squareSize
            y = scribbleViewModel.youAreHereY * squareSize
            gridX = Int(scribbleViewModel.youAreHereX)
            gridY = Int(scribbleViewModel.youAreHereY)
            createAvailableGrid()
        })
        .onChange(of:scribbleViewModel.id) {
            x = scribbleViewModel.youAreHereX * squareSize
            y = scribbleViewModel.youAreHereY * squareSize
            gridX = Int(scribbleViewModel.youAreHereX)
            gridY = Int(scribbleViewModel.youAreHereY)
            createAvailableGrid()
        }
    }
    
    func calculatenodesX(gridX: Int) -> [Int] {
        return [gridX-1, gridX, gridX+1, gridX+1, gridX+1,gridX,gridX-1, gridX-1]
        
    }
    
    func calculatenodesY(gridY: Int) -> [Int] {
        return [gridY-1,gridY-1, gridY-1,gridY,gridY+1, gridY+1, gridY+1, gridY]
    }
    
    func checkNodesInBounds(tempNodesX:[Int], tempNodesY:[Int], tempNodeNames: [String], gridSize:Int) -> Nodes {
        
        var newNodes: Nodes = Nodes()
        
        for index in 0...(tempNodesX.count-1) {
            if (tempNodesX[index] >= 0 &&
                tempNodesX[index] < gridSize && tempNodesY[index] >= 0 && tempNodesY[index] < gridSize)
            {
                newNodes.x.append(tempNodesX[index])
                newNodes.y.append(tempNodesY[index])
                newNodes.names.append(tempNodeNames[index])
            }
        }
        return newNodes
    }
    
    func createAvailableGrid() {
        
        let mainNodeNames =  ["NW", "NN", "NE","EE","SE","SS","SW", "WW"]
        let nodeNames = ["TL", "TR","BL","BR"]
        mainNodes = Nodes()
        bigNodes = [:]
        
        let mainNodesX = [gridX-1, gridX, gridX+1, gridX+1, gridX+1,gridX,gridX-1, gridX-1]
        let mainNodesY = [gridY-1,gridY-1, gridY-1,gridY,gridY+1, gridY+1, gridY+1, gridY]
        mainNodes = checkNodesInBounds(tempNodesX: mainNodesX, tempNodesY: mainNodesY, tempNodeNames: mainNodeNames, gridSize: Int(scribbleViewModel.gridSize))
        
        let NWnodesX = [-2+gridX, -1+gridX, -2+gridX, -1+gridX]
        let NWnodesY = [-2+gridY, -2+gridY, -1+gridY, -1+gridY]
        bigNodes["NW"] = checkNodesInBounds(tempNodesX: NWnodesX, tempNodesY: NWnodesY, tempNodeNames: nodeNames, gridSize:  Int(scribbleViewModel.gridSize))
        
        
        let NNnodesX = [0+gridX, 1+gridX, 0+gridX, 1+gridX]
        let NNnodesY = [-2+gridY, -2+gridY, -1+gridY, -1+gridY]
        bigNodes["NN"] = checkNodesInBounds(tempNodesX: NNnodesX, tempNodesY: NNnodesY, tempNodeNames: nodeNames, gridSize:  Int(scribbleViewModel.gridSize))
        
        
        let NEnodesX = [1+gridX, 2+gridX, 1+gridX, 2+gridX]
        let NEnodesY = [-2+gridY, -2+gridY, -1+gridY, -1+gridY]
        bigNodes["NE"] = checkNodesInBounds(tempNodesX: NEnodesX, tempNodesY: NEnodesY, tempNodeNames: nodeNames, gridSize:  Int(scribbleViewModel.gridSize))
        
        let EEnodesX = [1+gridX, 2+gridX, 1+gridX, 2+gridX]
        let EEnodesY = [0+gridY, 0+gridY, 1+gridY, 1+gridY]
        bigNodes["EE"] = checkNodesInBounds(tempNodesX: EEnodesX, tempNodesY: EEnodesY, tempNodeNames: nodeNames, gridSize:  Int(scribbleViewModel.gridSize))
        
        
        let SEnodesX = [1+gridX, 2+gridX, 1+gridX, 2+gridX]
        let SEnodesY = [1+gridY, 1+gridY, 2+gridY, 2+gridY]
        bigNodes["SE"] = checkNodesInBounds(tempNodesX: SEnodesX, tempNodesY: SEnodesY, tempNodeNames: nodeNames, gridSize:  Int(scribbleViewModel.gridSize))
        
        let SSnodesX = [-1+gridX, 0+gridX, -1+gridX, 0+gridX]
        let SSnodesY = [1+gridY, 1+gridY, 2+gridY, 2+gridY]
        bigNodes["SS"] = checkNodesInBounds(tempNodesX: SSnodesX, tempNodesY: SSnodesY, tempNodeNames: nodeNames, gridSize:  Int(scribbleViewModel.gridSize))
        
        let SWnodesX = [-2+gridX, -1+gridX, -2+gridX, -1+gridX]
        let SWnodesY = [1+gridY, 1+gridY, 2+gridY, 2+gridY]
        bigNodes["SW"] = checkNodesInBounds(tempNodesX: SWnodesX, tempNodesY: SWnodesY, tempNodeNames: nodeNames, gridSize:  Int(scribbleViewModel.gridSize))
        
        let WWnodesX = [-2+gridX, -1+gridX, -2+gridX, -1+gridX]
        let WWnodesY = [-1+gridY, -1+gridY, 0+gridY, 0+gridY]
        bigNodes["WW"] = checkNodesInBounds(tempNodesX: WWnodesX, tempNodesY: WWnodesY, tempNodeNames: nodeNames, gridSize:  Int(scribbleViewModel.gridSize))
        
    }
    
}


