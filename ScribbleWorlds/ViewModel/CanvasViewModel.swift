//
//  CanvasViewModel.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 5/1/24.
//

import Foundation
import SwiftUI
import PencilKit

class CanvasViewModel: ObservableObject {
    
    @Published var id = UUID()
    var landId = UUID()
    var data = Data()
    var width = CGFloat()
    var toolColor = UIColor(red: 0.86, green: 0.24, blue: 0.00, alpha: 1.00)
    var toolWidth = CGFloat(1.0)
    var toolType = String()
    
    
    func updateData() {
        CoreDataManager.instance.updateCanvas(id:id,
                                              landId: landId,
                                              data:data,
                                              toolColor: toolColor,
                                              toolType: toolType,
                                              toolWidth: toolWidth)
        }
    
    func convertCanvasDataToPNG() -> Image{
        let uiImage:UIImage
        updateData()
        do {
            let pkdrawingData = try PKDrawing(data: data)
            let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 1000, height: 1000))
            uiImage = pkdrawingData.image(from: rect, scale: 1.0)
        } catch { uiImage = UIImage()}
       return Image(uiImage: uiImage)
    }
    
    func getData(landId:UUID) {
        
        let canvasData =  CoreDataManager.instance.getCanvas(landId: landId)
        id = canvasData.id
        self.landId = canvasData.landId
        data = canvasData.data
        toolColor = canvasData.toolColor
        toolType = canvasData.toolType
        toolWidth = canvasData.toolWidth
    
    }
}
