//
//  Adventure.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 3/22/23.
//

import Foundation


struct Adventure: Identifiable {
    
    public var id: UUID = UUID()
    public var packId: UUID = UUID()
    public var packName: String = ""
    public var packDate: Date = Date.now
    public var thumbnail: Data = Data()
    
    
}
