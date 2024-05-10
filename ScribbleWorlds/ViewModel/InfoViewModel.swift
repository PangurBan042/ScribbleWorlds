//
//  InfoViewModel.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 4/3/24.
//

import Foundation

public class InfoViewModel: ObservableObject {
    
    var id: UUID = UUID()
    var packId: UUID = UUID()
    @Published var level: Int = 0
    var allLevels: [String] = [""]
    @Published var weaponName: String = ""
    @Published var weaponValue: Int = 0
    @Published var armorName: String = ""
    @Published var armorValue: Int = 0
    @Published var shieldName: String = ""
    @Published var shieldValue: Int = 0
    @Published var helmName: String = ""
    @Published var helmValue: Int = 0
    @Published var attackPoints: Int = 0
    @Published var defensePoints: Int = 0
    
    deinit {
        print("PackManager is deinitialized")
    }
    
    init(packId: UUID) {
        getData(packId: packId)
    }
    
    func getData(packId:UUID) {
        let infoData =  CoreDataManager.instance.getInfo(packId: packId)
        id = infoData.id
        self.packId = infoData.packId
        level = infoData.level
        allLevels = infoData.allLevels
        weaponName = infoData.weaponName
        weaponValue = infoData.weaponValue
        armorName = infoData.armorName
        armorValue = infoData.armorValue
        shieldName = infoData.shieldName
        shieldValue = infoData.shieldValue
        helmName = infoData.helmName
        helmValue = infoData.helmValue
        attackPoints = infoData.attackPoints
        defensePoints = infoData.defensePoints
    }
    
    func deleteData(id: UUID) {
        CoreDataManager.instance.deleteData(id:id)
    }
    
    func updateInfoOn(category: String, name: String, value: Int) {

        if category == "Weapon" {
            weaponName = name
            weaponValue = value
            attackPoints = weaponValue
            CoreDataManager.instance.updateInfoWeapon(id: id, weaponName: weaponName, weaponValue: weaponValue, attackPoints: attackPoints)
        } else if category == "Armor" {
            armorName = name
            armorValue = value
            defensePoints = armorValue + shieldValue + helmValue
            CoreDataManager.instance.updateInfoArmor(id: id, armorName: armorName, armorValue: armorValue, defensePoints: defensePoints)
        }else if category == "Shield" {
            shieldName = name
            shieldValue = value
            defensePoints = armorValue + shieldValue + helmValue
           CoreDataManager.instance.updateInfoShield(id: id, shieldName: shieldName, shieldValue: shieldValue, defensePoints: defensePoints)
        }  else if category == "Helm" {
            helmName = name
            helmValue = value
            defensePoints = armorValue + shieldValue + helmValue
          CoreDataManager.instance.updateInfoHelm(id: id, helmName: helmName, helmValue: helmValue, defensePoints: defensePoints )
        }
       
    }
    
    func updateInfoOff(category: String, value: Int) {
        if category == "Weapon" {
            weaponName = ""
            weaponValue = 0
            attackPoints = 0
            CoreDataManager.instance.updateInfoWeapon(id: id, weaponName: weaponName, weaponValue: weaponValue, attackPoints: attackPoints)
        } else if category == "Armor" {
            armorName = ""
            armorValue = 0
            defensePoints = armorValue + shieldValue + helmValue
            CoreDataManager.instance.updateInfoArmor(id: id, armorName: armorName, armorValue: armorValue, defensePoints: defensePoints)
        }else if category == "Shield" {
            shieldName = ""
            shieldValue = 0
            defensePoints = armorValue + shieldValue + helmValue
            CoreDataManager.instance.updateInfoShield(id: id, shieldName: shieldName, shieldValue: shieldValue, defensePoints: defensePoints)
        }  else if category == "Helm" {
            helmName = ""
            helmValue = 0
            defensePoints = armorValue + shieldValue + helmValue
            CoreDataManager.instance.updateInfoHelm(id: id, helmName: helmName, helmValue: helmValue, defensePoints: defensePoints)
        }
        
       
    }
    
}

