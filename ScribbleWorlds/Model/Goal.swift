//
//  Goal.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 9/9/22.
//

import Foundation


struct Goal: Identifiable {
    
    public var id: UUID = UUID()
    public var packId: UUID = UUID()
    public var currentLand: String = ""
    public var name: String = ""
    public var on: Bool = false
    
}
