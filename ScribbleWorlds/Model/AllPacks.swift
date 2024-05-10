//
//  AllPackDefaults.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 3/15/23.
//

import Foundation

struct AllPacks: Codable, Identifiable {
   
    var id = UUID()
    var name: String
    var type: String
    var description: String
   
    
    
    enum CodingKeys: CodingKey {
        case name
        case type
        case description
    }
    
    
    static func  getData(from fileName:String) -> [AllPacks] {
        return DataService.getData(fileName)
    }
}

