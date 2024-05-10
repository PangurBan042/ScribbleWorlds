//
//  Article.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 10/24/22.
//

import Foundation


struct Article: Identifiable {
    
    public var id: UUID = UUID()
    public var packId: UUID = UUID()
    public var name: String = ""
    public var category: String = ""
    public var type: String = ""
    public var permanent: Bool = false
    public var info: String = ""
    public var collected: [Bool] = []
    public var value: Int = 0
    public var on: [Bool] = []
    public var updateDate: Date = Date()
    
    
}
