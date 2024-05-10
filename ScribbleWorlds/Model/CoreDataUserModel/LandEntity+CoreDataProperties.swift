//
//  LandEntity+CoreDataProperties.swift
//  ScribbleWorlds 1.1
//
//  Created by Franny Moyse on 6/10/22.
//
//

import Foundation
import CoreData


extension LandEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LandEntity> {
        return NSFetchRequest<LandEntity>(entityName: "LandEntity")
    }

    @NSManaged public var idW: UUID?
    @NSManaged public var packIdW: UUID?
    @NSManaged public var scribbleIdW: UUID?
    @NSManaged public var tabIdW: UUID?
    @NSManaged public var previousFightW: String?
    @NSManaged public var afterLandW: String?
    @NSManaged public var priorLandW: String?
    @NSManaged public var currentTabW: String?
    @NSManaged public var currentTabSpun: Bool
    @NSManaged public var spinnerBackgroundW: String?
    @NSManaged public var currentFightW: String?
    @NSManaged public var fightHeadingW: String?
    @NSManaged public var overlayTabNameW: String?
    @NSManaged public var overlayTempViewW: String?
    @NSManaged public var alertTypeW: String?
    @NSManaged public var tabNamesW: [String]?
    @NSManaged public var currentArticlesW: [String]?
    @NSManaged public var autoPlaceNamesW: [String]?
    @NSManaged public var questPagesW: [String]?
    @NSManaged public var nameW: String?
    @NSManaged public var isFight: Bool
    @NSManaged public var readInfo: Bool
    @NSManaged public var isBackpack: Bool
    @NSManaged public var spinForLootOn: Bool
    @NSManaged public var packW: PackEntity?
    @NSManaged public var scribbleW: ScribbleEntity?
    @NSManaged public var tabW: TabEntity?
    @NSManaged public var goalsW: NSSet?
    @NSManaged public var spinnersW: NSSet?
    @NSManaged public var fightsW: NSSet?
    
    public var id: UUID {
        set {idW = newValue}
        get {idW ?? UUID()}
    }
    
    public var packId: UUID {
        set {packIdW = newValue}
        get {packIdW ?? UUID()}
    }
    
    public var scribbleId: UUID {
        set {scribbleIdW = newValue}
        get {scribbleIdW ?? UUID()}
    }
    
    public var tabId: UUID {
        set {tabIdW = newValue}
        get {tabIdW ?? UUID()}
    }
    
    public var previousFight: String {
        set {previousFightW = newValue}
        get {(previousFightW ?? "")}
    }
    
    public var overlayTempView: String {
        set {overlayTempViewW = newValue}
        get {(overlayTempViewW ?? "")}
    }
    
    public var overlayTabName: String {
        set {overlayTabNameW = newValue}
        get {(overlayTabNameW ?? "")}
    }
    
    public var currentTab: String {
        set {currentTabW = newValue}
        get {(currentTabW ?? "")}
    }
    
    public var spinnerBackground: String {
        set {spinnerBackgroundW = newValue}
        get {(spinnerBackgroundW ?? "")}
    }
    
    
    public var priorLand: String {
        set {priorLandW = newValue}
        get {(priorLandW ?? "")}
    }
    
    public var afterLand: String {
        set {afterLandW = newValue}
        get {(afterLandW ?? "")}
    }
    
    public var currentFight: String {
        set {currentFightW = newValue}
        get {(currentFightW ?? "")}
    }
    
    public var alertType: String {
        set {alertTypeW = newValue}
        get {(alertTypeW ?? "")}
    }
    
    public var fightHeading: String {
        set {fightHeadingW = newValue}
        get {(fightHeadingW ?? "")}
    }
    
    public var name: String {
        set {nameW = newValue}
        get {nameW ?? ""}
    }
    
    public var autoPlaceNames: [String] {
        set {autoPlaceNamesW = newValue}
        get {autoPlaceNamesW ?? [""]}
    }
    
    public var currentArticles: [String] {
        set {currentArticlesW = newValue}
        get {currentArticlesW ?? [""]}
    }
    
    public var questPages: [String] {
        set {questPagesW = newValue}
        get {questPagesW ?? [""]}
    }
    
    public var pack: PackEntity {
        packW ?? PackEntity()
    }
    
    public var scribble: ScribbleEntity {
        set {scribbleW = newValue}
        get{scribbleW ?? ScribbleEntity()}
    }
    
    public var tab: TabEntity {
        set {tabW = newValue}
        get{tabW ?? TabEntity()}
    }
    
    public var goals: [GoalEntity] {
        Array(goalsW as? Set<GoalEntity> ?? [])
    }
    
    public var spinners: [SpinnerEntity] {
        Array(spinnersW as? Set<SpinnerEntity> ?? [])
    }
    
    public var fights: [FightEntity] {
        Array(fightsW as? Set<FightEntity> ?? [])
    }

}

// MARK: Generated accessors for goalsW
extension LandEntity {

    @objc(addGoalsWObject:)
    @NSManaged public func addToGoalsW(_ value: GoalEntity)

    @objc(removeGoalsWObject:)
    @NSManaged public func removeFromGoalsW(_ value: GoalEntity)

    @objc(addGoalsW:)
    @NSManaged public func addToGoalsW(_ values: NSSet)

    @objc(removeGoalsW:)
    @NSManaged public func removeFromGoalsW(_ values: NSSet)

}


// MARK: Generated accessors for SpinnersW
extension LandEntity {

    @objc(addSpinnersWObject:)
    @NSManaged public func addToSpinnersW(_ value: SpinnerEntity)

    @objc(removeSpinnersWObject:)
    @NSManaged public func removeFromItemsW(_ value: SpinnerEntity)

    @objc(addSpinnersW:)
    @NSManaged public func addToSpinnersW(_ values: NSSet)

    @objc(removeSpinnersW:)
    @NSManaged public func removeFromSpinnersW(_ values: NSSet)
    
    

}

extension LandEntity {

    @objc(addFightsWObject:)
    @NSManaged public func addToFightsW(_ value: FightEntity)

    @objc(removeFightsWObject:)
    @NSManaged public func removeFromItemsW(_ value: FightEntity)

    @objc(addFightsW:)
    @NSManaged public func addToFightsW(_ values: NSSet)

    @objc(removeFightrsW:)
    @NSManaged public func removeFromFightsW(_ values: NSSet)

}


extension LandEntity : Identifiable {

}
