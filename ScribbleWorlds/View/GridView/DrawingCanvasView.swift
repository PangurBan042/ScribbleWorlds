//
//  DrawingCanvasView.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 12/14/23.
//

//import Foundation
//import SwiftUI
//import PencilKit
//
//struct DrawingCanvasView: UIViewControllerRepresentable {
//    
//    @ObservedObject var canvasViewModel: CanvasViewModel
//        
//    func updateUIViewController(_ viewController: DrawingCanvasViewController, context: Context) {
//       
//        let oldDrawing = viewController.canvas.drawing
//        do {
//            // Converting Data from new drawing from CoreData
//            let drawing = try PKDrawing.init(data:canvasViewModel.data)
//            if oldDrawing != drawing {
//                viewController.canvas.drawing = PKDrawing()
//                viewController.canvas.drawing = drawing
//            }
//        } catch {
//            //No Drawing Data in Core Data
//            viewController.canvas.drawing = PKDrawing()
//        }
//        // Reset undoManager
//        viewController.canvas.undoManager?.removeAllActions()
//        viewController.toolPicker.setVisible(true, forFirstResponder: viewController.canvas)
//        
//    }
//    
//    
//    func makeUIViewController(context: Context) -> DrawingCanvasViewController {
//        let viewController = DrawingCanvasViewController()
//        viewController.drawingData = canvasViewModel.data
//        viewController.drawingChanged = { data in
//            canvasViewModel.data = data
//        }
//        viewController.toolChanged = { inkingTool in
//            canvasViewModel.toolWidth = inkingTool.width
//            canvasViewModel.toolType = inkingTool.inkType.rawValue
//            canvasViewModel.toolColor = inkingTool.color
//        }
//        
//        return viewController
//    }
//
//}
//
