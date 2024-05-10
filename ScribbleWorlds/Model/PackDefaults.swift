//
//  PackDefaults.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 5/24/22.
//

import Foundation

struct PackDefaults: Codable, Identifiable {
   
   
   
    struct LandDefaults: Codable {
        
        struct FightDefaults: Codable {
            var name: String
            var nextFight: String
            var info: String
            var article: String
            var level: Int
            var attackPoints: Int
            var defensePoints: Int
            var on: [Bool]
        }
        var name: String
        var questPages: [String]
        var gridSize: Int
        var youAreHereX: Double
        var youAreHereY: Double
        var elements: [[String]]
        var priorLand: String
        var afterLand: String
        var autoPlaceNames: [String]
        var spinnerNames: [String]
        var tabNames: [String]
        var currentTab: String
        var spinnerBackground: String
        var goals: [String]
        var fightHeading: String
        var currentFight: String
        var fights: [FightDefaults]
    }
    
    struct SettingDefaults: Codable {
        var autofill: String
        var showCharacter: Bool
    }
    
    struct ItemDefaults: Codable {
        var name: String
        var info: String
        var on: [Bool]
    }
    
    struct ToolDefaults: Codable {
        var name: String
        var point: Int
        var info: String
        var on: Bool
    }
    
    struct InfoDefaults: Codable {
        var level: Int
        var allLevels: [String]
        var weaponName: String
        var weaponValue: Int
        var armorName: String
        var armorValue: Int
        var shieldName: String
        var shieldValue: Int
        var helmName: String
        var helmValue: Int
        var attackPoints: Int
        var defensePoints: Int
    }
    
    struct ArticleDefaults: Codable {
        var name: String
        var category: String
        var type: String
        var permanent: Bool
        var info: String
        var value: Int
        var on: [Bool]
    }
   
    var id = UUID()
    var name: String
    var type: String
    var settings: SettingDefaults
    var helpPages: [String]
    var currentLand: String
    var currentLandThumbnail: String
    var landOrder: [String]
    var info: InfoDefaults
    var heart: [Bool]
    var water: [Bool]
    var description: String
    var items: [ItemDefaults]
    var tools: [ToolDefaults]
    var articles: [ArticleDefaults]
    var lands: [LandDefaults]
    
    
    enum CodingKeys: CodingKey {
        
        case name
        case type
        case settings
        case helpPages
        case currentLand
        case currentLandThumbnail
        case landOrder
        case info
        case heart
        case water
        case description
        case items
        case tools
        case articles
        case lands
        
    
    }
    
    
    static func  getData(from fileName:String) -> PackDefaults {
        return DataService.getData(fileName)
    }
}

