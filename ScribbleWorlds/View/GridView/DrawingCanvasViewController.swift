//  CanvasView.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 2/23/22.

import SwiftUI
import PencilKit


class DrawingCanvasViewController: UIViewController {
    
    var drawingData = Data()
    var drawingChanged: (Data) -> Void = {_ in}
    var toolChanged: (PKInkingTool) -> Void = {_ in}
    
    lazy var canvas: PKCanvasView = {
        let view = PKCanvasView()
        view.drawingPolicy = .anyInput
        view.minimumZoomScale = 1
        view.maximumZoomScale = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var toolPicker: PKToolPicker = {
        let toolPicker = PKToolPicker()
        toolPicker.addObserver(self)
        return toolPicker
    }()

    
    
    
    override func viewDidLoad() {
        let _ = print("In DrawingCanvasViewController/viewDidLoad...")
        super.viewDidLoad()
        view.addSubview(canvas)
        NSLayoutConstraint.activate([
            canvas.leadingAnchor.constraint(equalTo:view.leadingAnchor),
            canvas.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            canvas.topAnchor.constraint(equalTo: view.topAnchor),
            canvas.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
        toolPicker.overrideUserInterfaceStyle = .light
        toolPicker.setVisible(true, forFirstResponder: canvas)
        toolPicker.addObserver(canvas)
        canvas.isOpaque = false
        canvas.delegate = self
        canvas.becomeFirstResponder()
        
        if let drawing = try? PKDrawing(data: drawingData) {
            canvas.drawing = drawing
        }
    }
}


extension DrawingCanvasViewController: PKToolPickerObserver, PKCanvasViewDelegate {
    
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
        drawingChanged(canvasView.drawing.dataRepresentation())
    }
    
    func toolPickerSelectedToolDidChange(_ toolPicker: PKToolPicker) {
    }
}
