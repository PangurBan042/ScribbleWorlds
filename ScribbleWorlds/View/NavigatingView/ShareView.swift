//
//  ShareView.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 1/30/23.
//

import Foundation
import SwiftUI

struct ShareView: View {
    
    @ObservedObject var viewManager: ViewManager
    private let url = URL(string: "https://www.scribbleworlds.com")!
   
   var body: some View {
       let _ = print("!!!In ShareView!!!")
       VStack {
           //ShareLink(item: url, label:"")
       }
   }
}
