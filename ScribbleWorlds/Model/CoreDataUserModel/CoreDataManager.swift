//
//  CoreDataManager.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 6/1/22.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    
    static let instance = CoreDataManager()
    
    private init() {}
    
    deinit {
        print("CoreDataManager is deinitialized")
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentCloudKitContainer(name:"CoreDataContainer")
        
        container.loadPersistentStores { (storeDescr, error) in
            if let error = error  as NSError? {
                fatalError ("Unresolved error: \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    
    
    func saveData() {
        let context = persistentContainer.viewContext
        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError ("Unresolved error: \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    func addData(packDefault:PackDefaults, packId: UUID) {
        let packEntity = PackEntity(context: persistentContainer.viewContext)
        packEntity.id = packId
        packEntity.name = packDefault.name
        packEntity.type = packDefault.type
        packEntity.helpPages = packDefault.helpPages
        packEntity.currentLand = packDefault.currentLand
        packEntity.characterIsDead = false
        
        let settingsEntity = SettingsEntity(context: persistentContainer.viewContext)
        settingsEntity.id = UUID()
        settingsEntity.packId = packEntity.id
        settingsEntity.autofill = packDefault.settings.autofill
        settingsEntity.showCharacter = packDefault.settings.showCharacter
        packEntity.settings = settingsEntity
        saveData()
        
        let heartsEntity = HeartsEntity(context: persistentContainer.viewContext)
        heartsEntity.id = UUID()
        heartsEntity.packId = packEntity.id
        heartsEntity.on = packDefault.heart
        heartsEntity.count = packDefault.heart.filter{$0 == true}.count
        heartsEntity.tempCount = heartsEntity.count
        saveData()
        
        let waterEntity = WaterEntity(context: persistentContainer.viewContext)
        waterEntity.id = UUID()
        waterEntity.packId = packEntity.id
        waterEntity.on = packDefault.water
        waterEntity.count = packDefault.water.filter{$0 == true}.count
        waterEntity.tempCount = waterEntity.count
        saveData()
        
        let navigateEntity = NavigateEntity(context: persistentContainer.viewContext)
        navigateEntity.id = UUID()
        navigateEntity.packId = packEntity.id
        navigateEntity.menuSelection = ""
        saveData()
        
        
        let infoEntity = InfoEntity(context: persistentContainer.viewContext)
        infoEntity.id = UUID()
        infoEntity.packId = packEntity.id
        infoEntity.level = packDefault.info.level
        infoEntity.allLevels = packDefault.info.allLevels
        infoEntity.weaponName = packDefault.info.weaponName
        infoEntity.weaponValue = packDefault.info.weaponValue
        infoEntity.armorName = packDefault.info.armorName
        infoEntity.armorValue = packDefault.info.armorValue
        infoEntity.shieldName = packDefault.info.shieldName
        infoEntity.shieldValue = packDefault.info.shieldValue
        infoEntity.helmName = packDefault.info.helmName
        infoEntity.helmValue = packDefault.info.helmValue
        infoEntity.attackPoints = packDefault.info.attackPoints
        infoEntity.defensePoints = packDefault.info.defensePoints
        saveData()
        
        if packEntity.type == "Adventure" {
            let adventureEntity = AdventureEntity(context: persistentContainer.viewContext)
            adventureEntity.id = UUID()
            adventureEntity.packId = packEntity.id
            adventureEntity.packName = packDefault.name
            adventureEntity.packDate = Date()
            adventureEntity.thumbnail = Data()
            saveData()
        }
        
        
        for tool in packDefault.tools {
            let toolEntity = ToolEntity(context: persistentContainer.viewContext)
            toolEntity.id = UUID()
            toolEntity.packId = packEntity.id
            toolEntity.name = tool.name
            toolEntity.point = tool.point
            toolEntity.info = tool.info
            toolEntity.on = tool.on
            packEntity.addToToolsW(toolEntity)
            saveData()
        }
        
        for article in packDefault.articles {
            let articleEntity = ArticleEntity(context: persistentContainer.viewContext)
            articleEntity.id = UUID()
            articleEntity.packId = packEntity.id
            articleEntity.name = article.name
            articleEntity.category = article.category
            articleEntity.type = article.type
            articleEntity.permanent = article.permanent
            articleEntity.info = article.info
            articleEntity.collected = article.on
            articleEntity.value = article.value
            articleEntity.on = article.on
            packEntity.addToArticlesW(articleEntity)
            saveData()
        }
        
        for land in packDefault.lands {
            let landEntity = LandEntity(context:persistentContainer.viewContext)
            landEntity.id = UUID()
            landEntity.name = land.name
            landEntity.questPages = land.questPages
            landEntity.scribbleId = UUID()
            landEntity.tabId = UUID()
            landEntity.packId = packEntity.id
            landEntity.priorLand = land.priorLand
            landEntity.afterLand = land.afterLand
            landEntity.currentFight = land.currentFight
            landEntity.fightHeading = land.fightHeading
            landEntity.alertType = ""
            landEntity.currentTab = land.currentTab
            landEntity.spinnerBackground = land.spinnerBackground
            landEntity.autoPlaceNames = land.autoPlaceNames
            packEntity.addToLandsW(landEntity)
            
            let tabEntity = TabEntity(context:persistentContainer.viewContext)
            tabEntity.id = landEntity.tabId
            tabEntity.landId = landEntity.id  //may not need
            tabEntity.name = landEntity.currentTab
            tabEntity.backgroundName = land.spinnerBackground
            tabEntity.spinnerImageNames = land.tabNames
            tabEntity.spinnerNames = land.spinnerNames
            landEntity.tab = tabEntity
            
            
            let scribbleEntity = ScribbleEntity(context:persistentContainer.viewContext)
            scribbleEntity.id = landEntity.scribbleId
            scribbleEntity.landId = landEntity.id
            scribbleEntity.gridSize = land.gridSize
            scribbleEntity.background = land.name
            scribbleEntity.elements = land.elements
            scribbleEntity.youAreHereX = land.youAreHereX
            scribbleEntity.youAreHereY = land.youAreHereY
            landEntity.scribble = scribbleEntity
            saveData()
            
            let canvasEntity =
            CanvasEntity(context:persistentContainer.viewContext)
            canvasEntity.id = UUID()
            canvasEntity.landId = landEntity.id
            canvasEntity.data = Data()
            //canvasEntity.toolWidth = CGFloat()
            canvasEntity.toolColor =  UIColor(red: 0.86, green: 0.24, blue: 0.00, alpha: 1.00)
            canvasEntity.toolType = "com"+"."+"apple"+"."+"ink"+"."+"pen"
            canvasEntity.toolWidth = 1.0
            scribbleEntity.canvas = canvasEntity
            saveData()
            
            for goal in land.goals {
                let goalEntity = GoalEntity(context: persistentContainer.viewContext)
                goalEntity.id = UUID()
                goalEntity.packId = packEntity.id
                goalEntity.currentLand = landEntity.name
                goalEntity.name = goal
                goalEntity.on = false
                landEntity.addToGoalsW(goalEntity)
                saveData()
            }
            
            for fight in land.fights {
                let fightEntity = FightEntity(context: persistentContainer.viewContext)
                let duelEntity = DuelEntity(context: persistentContainer.viewContext)
                
                fightEntity.id = UUID()
                fightEntity.landId = landEntity.id
                fightEntity.name = fight.name
                fightEntity.nextFight = fight.nextFight
                fightEntity.info = fight.info
                fightEntity.article = fight.article
                fightEntity.level = fight.level
                fightEntity.attackPoints = fight.attackPoints
                fightEntity.defensePoints = fight.defensePoints
                fightEntity.on = fight.on
                fightEntity.count = fight.on.count
                fightEntity.isDead = false
                fightEntity.showSpinForLootView = false
                fightEntity.showDefeatedView = false
                fightEntity.showDuelView = false
                landEntity.addToFightsW(fightEntity)
                duelEntity.id = UUID()
                duelEntity.landId = landEntity.id
                duelEntity.characterHearts = 0
                duelEntity.enemyHearts = 0
                duelEntity.fightName = fight.name
                saveData()
            }
            
            for spinner in land.spinnerNames{
                let spinnerEntity = SpinnerEntity(context: persistentContainer.viewContext)
                spinnerEntity.id = UUID()
                spinnerEntity.landId = landEntity.id
                spinnerEntity.name = spinner
                spinnerEntity.wedgeAngle = 0
                spinnerEntity.wedgeIndex = 0
//                if spinnerEntity.wedgeName == "" {
//                    spinnerEntity.wedgeIndex = 0
//                }
                //spinnerEntity.wedgeName = spinnerEntity.wedgeName
                landEntity.addToSpinnersW(spinnerEntity)
                saveData()
            }
            saveData()
        }
        saveData()
    }
    
    
    func getAllAdventures() -> [Adventure] {
        let request: NSFetchRequest<AdventureEntity> = AdventureEntity.fetchRequest()
        request.returnsObjectsAsFaults = false
        var adventuresResults = [Adventure]()
        
        do {
            let result = try persistentContainer.viewContext.fetch(request)
            
            for data in result {
                
                adventuresResults.append(Adventure(id: data.id, packId: data.packId, packName: data.packName, packDate: data.packDate, thumbnail: data.thumbnail))
                
            }
        } catch {
            print("Fetching Failed")
        }
        
        return adventuresResults
    }
    
    func getAllTabs() -> [TabEntity] {
        let request: NSFetchRequest<TabEntity> = TabEntity.fetchRequest()
        request.returnsObjectsAsFaults = false
        var tabResults = [TabEntity]()
        
        do {
            let result = try persistentContainer.viewContext.fetch(request)
            
            for data in result {
                tabResults.append(data)
            }
            
        } catch {
            print("Fetching Failed")
        }
        
        return tabResults
    }
    
    
    func getAllGoals(packId: UUID, currentLand: String) -> [Goal] {
        let request: NSFetchRequest<GoalEntity> = GoalEntity.fetchRequest()
        let filter = NSPredicate(format: "packIdW == %@ AND currentLandW == %@", packId as CVarArg, currentLand as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var goalsResults = [Goal]()
        
        do {
            let result = try persistentContainer.viewContext.fetch(request)
            
            for data in result {
                goalsResults.append(Goal(id: data.id, packId: data.packId, currentLand: data.currentLand, name: data.name,  on: data.on))
            }
        } catch {
            print("Fetching Failed")
        }
        
        return goalsResults
    }
    
    

    func getAllFights(landId: UUID) -> [Fight] {
        let request: NSFetchRequest<FightEntity> = FightEntity.fetchRequest()
        let filter = NSPredicate(format: "landIdW == %@", landId as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fightsResults = [Fight]()
        
        do {
            let result = try persistentContainer.viewContext.fetch(request)
            
            for data in result {
                fightsResults.append(Fight(id: data.id,
                                           landId: data.landId,
                                           name: data.name,
                                           nextFight: data.nextFight,
                                           info: data.info,
                                           article: data.article,
                                           level: data.level,
                                           attackPoints: data.attackPoints,
                                           defensePoints: data.defensePoints,
                                           on: data.on,
                                           isDead: data.isDead,
                                           showSpinForLootView: data.showSpinForLootView,
                                           showDefeatedView: data.showDefeatedView,
                                           showDuelView: data.showDuelView))
                
            }
        } catch {
            print("Fetching Failed")
        }
        
        return fightsResults
    }
    
    
    
    func getAllArticles(packId: UUID) -> [Article] {
        let request: NSFetchRequest<ArticleEntity> = ArticleEntity.fetchRequest()
        let filter = NSPredicate(format: "packIdW == %@", packId as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var articlesResults = [Article]()
        
        do {
            let result = try persistentContainer.viewContext.fetch(request)
            
            for data in result {
                articlesResults.append(Article(id: data.id, packId: data.packId, name: data.name, category: data.category, type: data.type, permanent: data.permanent, info: data.info, collected: data.collected,  value: data.value, on: data.on))
                
            }
        } catch {
            print("Fetching Failed")
        }
        
        return articlesResults
    }
    
    func getPack(packId: UUID) -> PackEntity {
        
        let request: NSFetchRequest<PackEntity> = PackEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", packId as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var packEntity:PackEntity
        
        do {
            packEntity = try persistentContainer.viewContext.fetch(request).first ?? PackEntity()
        } catch {
            packEntity = PackEntity()
            print("Fetching Failed")
        }
        
        return packEntity
    }
    
    func getInfo(packId: UUID) -> InfoEntity {
        
        let request: NSFetchRequest<InfoEntity> = InfoEntity.fetchRequest()
        let filter = NSPredicate(format: "packIdW == %@", packId as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var infoEntity:InfoEntity
        
        do {
            infoEntity = try persistentContainer.viewContext.fetch(request).first ?? InfoEntity()
        } catch {
            infoEntity = InfoEntity()
            print("Fetching Failed")
        }
        
        return infoEntity
    }
    
    func getSettings(packId: UUID) -> SettingsEntity {
        
        let request: NSFetchRequest<SettingsEntity> = SettingsEntity.fetchRequest()
        let filter = NSPredicate(format: "packIdW == %@", packId as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var settingsEntity:SettingsEntity
        
        do {
            settingsEntity = try persistentContainer.viewContext.fetch(request).first ?? SettingsEntity()
        } catch {
            settingsEntity = SettingsEntity()
            print("Fetching Failed")
        }
        
        return settingsEntity
    }
    
    
    func getAdventure(id: UUID) -> AdventureEntity {
        
        let request: NSFetchRequest<AdventureEntity> =
        AdventureEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", id as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var adventureEntity:AdventureEntity
        
        do {
            adventureEntity = try persistentContainer.viewContext.fetch(request).first ?? AdventureEntity()
        } catch {
            adventureEntity = AdventureEntity()
            print("Fetching Failed")
        }
        
        return adventureEntity
    }
    
    func getAdventure(packId: UUID) -> AdventureEntity {
        
        let request: NSFetchRequest<AdventureEntity> =
        AdventureEntity.fetchRequest()
        let filter = NSPredicate(format: "packIdW == %@", packId as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var adventureEntity:AdventureEntity
        
        do {
            adventureEntity = try persistentContainer.viewContext.fetch(request).first ?? AdventureEntity()
        } catch {
            adventureEntity = AdventureEntity()
            
        }
        
        return adventureEntity
    }
    
    func getScribble(scribbleId: UUID) -> ScribbleEntity {
        let request: NSFetchRequest<ScribbleEntity> = ScribbleEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", scribbleId as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var scribbleEntity:ScribbleEntity
        
        do {
            scribbleEntity = try persistentContainer.viewContext.fetch(request).first ?? ScribbleEntity()
        } catch {
            scribbleEntity = ScribbleEntity()
            print("Fetching Failed")
        }
        
        return scribbleEntity
    }
    
    
    
    func getGoal(goalId: UUID) -> GoalEntity {
        let request: NSFetchRequest<GoalEntity> = GoalEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", goalId as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var goalEntity:GoalEntity
        
        do {
            goalEntity = try persistentContainer.viewContext.fetch(request).first ?? GoalEntity()
        } catch {
            goalEntity = GoalEntity()
            print("Fetching Failed")
        }
        
        return goalEntity
    }
    
    func getTab(landId: UUID) -> TabEntity {
        let request: NSFetchRequest<TabEntity> = TabEntity.fetchRequest()
        let filter = NSPredicate(format: "landIdW == %@", landId as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var tabEntity:TabEntity
        
        do {
            tabEntity = try persistentContainer.viewContext.fetch(request).first ?? TabEntity()
        } catch {
            tabEntity = TabEntity()
            print("Fetching Failed")
        }
        
        return tabEntity
    }
    
    
    func getTool(toolId: UUID) -> ToolEntity {
        let request: NSFetchRequest<ToolEntity> = ToolEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", toolId as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var toolEntity:ToolEntity
        
        do {
            toolEntity = try persistentContainer.viewContext.fetch(request).first ?? ToolEntity()
        } catch {
            toolEntity = ToolEntity()
            print("Fetching Failed")
        }
        
        return toolEntity
    }
    
//    func getTool(packId: UUID) -> SettingsEntity {
//        let request: NSFetchRequest<SettingsEntity> = SettingsEntity.fetchRequest()
//        let filter = NSPredicate(format: "idW == %@", packId as CVarArg)
//        request.predicate = filter
//        request.returnsObjectsAsFaults = false
//        var settingsEntity:SettingsEntity
//        
//        do {
//            settingsEntity = try persistentContainer.viewContext.fetch(request).first ?? SettingsEntity()
//        } catch {
//            settingsEntity = SettingsEntity()
//            print("Fetching Failed")
//        }
//        
//        return settingsEntity
//    }
    
    
    func getArticle(articleId: UUID) -> ArticleEntity {
        let request: NSFetchRequest<ArticleEntity> = ArticleEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", articleId as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var articleEntity:ArticleEntity
        
        do {
            articleEntity = try persistentContainer.viewContext.fetch(request).first ?? ArticleEntity()
        } catch {
            articleEntity = ArticleEntity()
            print("Fetching Failed")
        }
        
        return articleEntity
    }
    
    
    func getFight(landId: UUID, name:String) -> FightEntity {
        let request: NSFetchRequest<FightEntity> = FightEntity.fetchRequest()
        let filter = NSPredicate(format: "landIdW == %@", landId as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fightEntity:FightEntity
        
        do {
            let fights = try persistentContainer.viewContext.fetch(request)
            fightEntity = fights.filter{$0.name == name}.first ?? FightEntity()
        } catch {
            fightEntity = FightEntity()
            print("Fetching Failed")
        }
        
        return fightEntity
    }
    
    func getDuel(landId: UUID) -> DuelEntity {
        let request: NSFetchRequest<DuelEntity> = DuelEntity.fetchRequest()
        let filter = NSPredicate(format: "landIdW == %@", landId as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var duelEntity:DuelEntity
        
        do {
            duelEntity = try persistentContainer.viewContext.fetch(request).first ?? DuelEntity()
            
        } catch {
            duelEntity = DuelEntity()
            print("Fetching Failed")
        }
        
        return duelEntity
    }
    
    
    func getArticle(packId: UUID, name:String) -> ArticleEntity {
        
        let request: NSFetchRequest<ArticleEntity> = ArticleEntity.fetchRequest()
        let filter = NSPredicate(format: "packIdW == %@", packId as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var articleEntity:ArticleEntity
        
        do {
            let articles = try persistentContainer.viewContext.fetch(request)
            articleEntity = articles.filter{$0.name == name}.first ?? ArticleEntity()
        } catch {
            articleEntity = ArticleEntity()
            print("Fetching Failed")
        }
        return articleEntity
    }
    
    func getLand(packId: UUID, name: String) -> LandEntity {
        let request = NSFetchRequest<LandEntity>(entityName: "LandEntity")
        let filter = NSPredicate(format: "packIdW == %@", packId as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var  landEntity: LandEntity
        do {
            let lands = try persistentContainer.viewContext.fetch(request)
            landEntity = lands.filter{$0.name == name}.first ?? LandEntity()
        } catch {
            landEntity = LandEntity()
            print("Fetching Failed")
        }
        
        return landEntity
    }
    
    func getSpinner(landId: UUID, name: String) -> SpinnerEntity {
        
        let request = NSFetchRequest<SpinnerEntity>(entityName: "SpinnerEntity")
        let filter = NSPredicate(format: "landIdW == %@", landId as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var  spinnerEntity: SpinnerEntity
        do {
            let spinners = try persistentContainer.viewContext.fetch(request)
            spinnerEntity =  spinners.filter{$0.name == name}.first ?? SpinnerEntity()
        } catch {
            spinnerEntity = SpinnerEntity()
            print("Fetching Failed")
        }
        
        return spinnerEntity
    }
    
    func getSpinner(id: UUID) -> SpinnerEntity {
        
        let request = NSFetchRequest<SpinnerEntity>(entityName: "SpinnerEntity")
        let filter = NSPredicate(format: "idW == %@", id as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var  spinnerEntity: SpinnerEntity
        do {
            spinnerEntity = try persistentContainer.viewContext.fetch(request).first ?? SpinnerEntity()
        } catch {
            spinnerEntity = SpinnerEntity()
            print("Fetching Failed")
        }
        
        return spinnerEntity
    }
    
    func getCanvas(landId:UUID) -> CanvasEntity {
        
        let request = NSFetchRequest<CanvasEntity>(entityName: "CanvasEntity")
        let filter = NSPredicate(format: "landIdW == %@", landId as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var  canvasEntity: CanvasEntity
        
        do {
            canvasEntity = try persistentContainer.viewContext.fetch(request).first ?? CanvasEntity()
        } catch {
            canvasEntity = CanvasEntity()
            print("Fetching Failed")
        }
        
        return canvasEntity
    }
    
    
//    func getPackNames() -> [String] {
//        let request: NSFetchRequest<PackEntity> = PackEntity.fetchRequest()
//        request.returnsObjectsAsFaults = false
//        var fetchResults = [String]()
//        
//        do {
//            let result = try persistentContainer.viewContext.fetch(request)
//            for data in result {
//                fetchResults.append(data.name)
//            }
//        } catch {
//            print("Fetching Failed")
//        }
//        
//        return fetchResults
//    }
    
    
    func getLandNames(packId: UUID) -> [String] {
        let request: NSFetchRequest<LandEntity> = LandEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", packId as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fetchResults = [String]()
        
        do {
            let result = try persistentContainer.viewContext.fetch(request)
            for data in result {
                fetchResults.append(data.name)
            }
        } catch {
            print("Fetching Failed")
        }
        
        return fetchResults
    }
    
    
    func updateAdventureDate(adventure: Adventure){
        let request: NSFetchRequest<AdventureEntity> = AdventureEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", adventure.id as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fetchResult:AdventureEntity?
        do {
            fetchResult = try persistentContainer.viewContext.fetch(request).first ?? AdventureEntity()
            fetchResult?.packDate = adventure.packDate
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    
    func updateAdventureThumbnail(adventure: Adventure){
        let request: NSFetchRequest<AdventureEntity> = AdventureEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", adventure.id as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fetchResult:AdventureEntity?
        do {
            fetchResult = try persistentContainer.viewContext.fetch(request).first ?? AdventureEntity()
            fetchResult?.thumbnail = adventure.thumbnail
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    func updateIsDead(fight: Fight){
        let request: NSFetchRequest<FightEntity> = FightEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", fight.id as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fetchResult:FightEntity?
        
        do {
            fetchResult = try persistentContainer.viewContext.fetch(request).first ?? FightEntity()
            fetchResult?.isDead = fight.isDead
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    func updateGoalOn(goal: Goal){
        let request: NSFetchRequest<GoalEntity> = GoalEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", goal.id as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var goalEntity:GoalEntity
        
        do {
            goalEntity = try persistentContainer.viewContext.fetch(request).first ?? GoalEntity()
            goalEntity.on = goal.on
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    
    func updateArticleOn(article: Article){
        let request: NSFetchRequest<ArticleEntity> = ArticleEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", article.id as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var articleEntity:ArticleEntity
        
        do {
            articleEntity = try persistentContainer.viewContext.fetch(request).first ?? ArticleEntity()
            articleEntity.on = article.on
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    func updateArticleCollectedOn(article: Article){
        let request: NSFetchRequest<ArticleEntity> = ArticleEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", article.id as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var articleEntity:ArticleEntity
        
        do {
            articleEntity = try persistentContainer.viewContext.fetch(request).first ?? ArticleEntity()
            articleEntity.collected = article.collected
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    func updateArticlePackId(article: Article){
        let request: NSFetchRequest<ArticleEntity> = ArticleEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", article.id as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var articleEntity:ArticleEntity
        
        do {
            articleEntity = try persistentContainer.viewContext.fetch(request).first ?? ArticleEntity()
            articleEntity.packId = article.packId
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    func updateFightOn(fight: Fight){
        let request: NSFetchRequest<FightEntity> = FightEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", fight.id as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fightEntity:FightEntity
        
        do {
            fightEntity = try persistentContainer.viewContext.fetch(request).first ?? FightEntity()
            fightEntity.on = fight.on
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    func updateFightAttackPointsForOneBattle(fight: Fight){
        let request: NSFetchRequest<FightEntity> = FightEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", fight.id as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fightEntity:FightEntity
        
        do {
            fightEntity = try persistentContainer.viewContext.fetch(request).first ?? FightEntity()
            fightEntity.attackPointsForOneBattle = fight.attackPointsForOneBattle
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    func updateFightDefensePointsForOneBattle(fight: Fight){
        let request: NSFetchRequest<FightEntity> = FightEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", fight.id as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fightEntity:FightEntity
        
        do {
            fightEntity = try persistentContainer.viewContext.fetch(request).first ?? FightEntity()
            fightEntity.defensePointsForOneBattle = fight.defensePointsForOneBattle
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    func updateFightCount(fight: Fight){
        let request: NSFetchRequest<FightEntity> = FightEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", fight.id as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fightEntity:FightEntity
        
        do {
            fightEntity = try persistentContainer.viewContext.fetch(request).first ?? FightEntity()
            fightEntity.count = fight.count
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    func updateFightShowDefeatedView(fight: Fight){
        let request: NSFetchRequest<FightEntity> = FightEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", fight.id as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fightEntity:FightEntity
        
        do {
            fightEntity = try persistentContainer.viewContext.fetch(request).first ?? FightEntity()
            fightEntity.showDefeatedView = fight.showDefeatedView
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    func updateFightShowDuelView(fight: Fight){
        let request: NSFetchRequest<FightEntity> = FightEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", fight.id as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fightEntity:FightEntity
        
        do {
            fightEntity = try persistentContainer.viewContext.fetch(request).first ?? FightEntity()
            fightEntity.showDuelView = fight.showDuelView
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    func updateFightShowSpinForLootView(fight: Fight){
        let request: NSFetchRequest<FightEntity> = FightEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", fight.id as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fightEntity:FightEntity
        
        do {
            fightEntity = try persistentContainer.viewContext.fetch(request).first ?? FightEntity()
            fightEntity.showSpinForLootView = fight.showSpinForLootView
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    func updateSpinnerWedgeInfo(spinnerId: UUID, wedgeInfo: String){
        let request: NSFetchRequest<SpinnerEntity> = SpinnerEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", spinnerId as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fetchResult: SpinnerEntity?
        
        do {
            fetchResult = try persistentContainer.viewContext.fetch(request).first ?? SpinnerEntity()
            fetchResult?.wedgeInfo = wedgeInfo
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    func updateSpinnerWedgeName(spinnerId: UUID, wedgeName: String){
        let request: NSFetchRequest<SpinnerEntity> = SpinnerEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", spinnerId as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fetchResult: SpinnerEntity?
        
        do {
            fetchResult = try persistentContainer.viewContext.fetch(request).first ?? SpinnerEntity()
            fetchResult?.wedgeName = wedgeName
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    func updateSpinnerWedgeIndex(spinnerId: UUID, wedgeIndex: Int){
        let request: NSFetchRequest<SpinnerEntity> = SpinnerEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", spinnerId as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fetchResult: SpinnerEntity?
        
        do {
            fetchResult = try persistentContainer.viewContext.fetch(request).first ?? SpinnerEntity()
            fetchResult?.wedgeIndex = wedgeIndex
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    
    func updateSpinnerWedge(spinnerId: UUID, wedgeName:String, wedgeIndex: Int, wedgeInfo:String){
        let request: NSFetchRequest<SpinnerEntity> = SpinnerEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", spinnerId as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fetchResult: SpinnerEntity?
        
        do {
            fetchResult = try persistentContainer.viewContext.fetch(request).first ?? SpinnerEntity()
            fetchResult?.wedgeIndex = wedgeIndex
            fetchResult?.wedgeName  = wedgeName
            fetchResult?.wedgeInfo  = wedgeInfo
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    

    func updateSpinnerShowInfo(spinnerId: UUID, showInfo:Bool){
        let request: NSFetchRequest<SpinnerEntity> = SpinnerEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", spinnerId as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fetchResult = SpinnerEntity()
        
        do {
            fetchResult = try persistentContainer.viewContext.fetch(request).first ?? SpinnerEntity()
            fetchResult.showInfo = showInfo
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    func deleteData(id:UUID) {
        let request: NSFetchRequest<PackEntity> = PackEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", id as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        do {
            let fetchResults = try persistentContainer.viewContext.fetch(request)
            
            for item in fetchResults {
                
                persistentContainer.viewContext.delete(item)
            }
            saveData()
        } catch {
            print("Fetching Failed")
        }
        
    }
    
    
    func deleteAdventure(id:UUID) {
        let request: NSFetchRequest<AdventureEntity> = AdventureEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@",id as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        do {
            let fetchResults = try persistentContainer.viewContext.fetch(request)
            
            for item in fetchResults {
                persistentContainer.viewContext.delete(item)
            }
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    
    
    
    
    func getHearts(packId: UUID) -> HeartsEntity {
        let request: NSFetchRequest<HeartsEntity> = HeartsEntity.fetchRequest()
        let filter = NSPredicate(format: "packIdW == %@", packId as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var heartsEntity:HeartsEntity
        
        do {
            heartsEntity = try persistentContainer.viewContext.fetch(request).first ?? HeartsEntity()
        } catch {
            heartsEntity = HeartsEntity()
            print("Fetching Failed")
        }
        
        return heartsEntity
    }
    
    
    
    func getWater(packId: UUID) -> WaterEntity {
        let request: NSFetchRequest<WaterEntity> = WaterEntity.fetchRequest()
        let filter = NSPredicate(format: "packIdW == %@", packId as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var waterEntity:WaterEntity
        
        do {
            waterEntity = try persistentContainer.viewContext.fetch(request).first ?? WaterEntity()
        } catch {
            waterEntity = WaterEntity()
            print("Fetching Failed")
        }
        
        return waterEntity
    }
    
    func getNavigate(packId: UUID) -> NavigateEntity {
        let request: NSFetchRequest<NavigateEntity> = NavigateEntity.fetchRequest()
        let filter = NSPredicate(format: "packIdW == %@", packId as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var navigateEntity:NavigateEntity
        
        do {
            navigateEntity = try persistentContainer.viewContext.fetch(request).first ?? NavigateEntity()
        } catch {
            navigateEntity = NavigateEntity()
            print("Fetching Failed")
        }
        
        return navigateEntity
    }
    
    ///----------------------------------------New functions-----------------------------------------
    
    func updateLand(id: UUID,
                    packId: UUID,
                    scribbleId: UUID,
                    tabId: UUID,
                    priorLand: String,
                    afterLand: String,
                    name: String,
                    fightHeading: String,
                    alertType: String,
                    questPages: [String],
                    autoPlaceNames: [String],
                    currentTab: String,
                    spinnerBackground: String,
                    currentFight: String,
                    readInfo: Bool,
                    currentArticles: [String]) {
        
        let request: NSFetchRequest<LandEntity> = LandEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", id as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fetchResult: LandEntity?
        
        do {
            fetchResult = try persistentContainer.viewContext.fetch(request).first ?? LandEntity()
            fetchResult?.scribbleId = scribbleId
            fetchResult?.tabId  = tabId
            fetchResult?.priorLand = priorLand
            fetchResult?.afterLand = afterLand
            fetchResult?.name = name
            fetchResult?.fightHeading = fightHeading
            fetchResult?.alertType = alertType
            fetchResult?.questPages = questPages
            fetchResult?.autoPlaceNames = autoPlaceNames
            fetchResult?.currentTab = currentTab
            fetchResult?.spinnerBackground = spinnerBackground
            fetchResult?.currentFight = currentFight
            fetchResult?.readInfo = readInfo
            fetchResult?.currentArticles = currentArticles
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    
    func updateLandReadInfo(id: UUID,
                            readInfo: Bool) {
        
        let request: NSFetchRequest<LandEntity> = LandEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", id as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fetchResult: LandEntity?
        
        do {
            fetchResult = try persistentContainer.viewContext.fetch(request).first ?? LandEntity()
            fetchResult?.readInfo = readInfo
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    
    
    
    
    func updatePack(packId:UUID,
                    date:Date,
                    currentLand: String,
                    characterIsDead: Bool)
    {
        let request: NSFetchRequest<PackEntity> = PackEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", packId as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fetchResult: PackEntity?
        
        do {
            fetchResult = try persistentContainer.viewContext.fetch(request).first ?? PackEntity()
            
            fetchResult?.date  = date
            fetchResult?.currentLand = currentLand
            fetchResult?.characterIsDead = characterIsDead
          
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    func updateAdventure(id:UUID,
                         packId:UUID,
                         packName: String,
                         packDate: Date,
                         thumbnail: Data)
    {
        let request: NSFetchRequest<AdventureEntity> = AdventureEntity.fetchRequest()
        let filter = NSPredicate(format: "packIdW == %@", packId as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fetchResult: AdventureEntity?
        
        do {
            fetchResult = try persistentContainer.viewContext.fetch(request).first ?? AdventureEntity()
            
            fetchResult?.packName  = packName
            fetchResult?.packDate = packDate
            fetchResult?.thumbnail = thumbnail
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    
    func updateScribble(scribbleId: UUID,
                        elements: [[String]],
                        youAreHereX: Double,
                        youAreHereY: Double)
    {
        let request: NSFetchRequest<ScribbleEntity> = ScribbleEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", scribbleId as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fetchResult:ScribbleEntity?
        
        do {
            fetchResult = try persistentContainer.viewContext.fetch(request).first ?? ScribbleEntity()
            fetchResult?.elements = elements
            fetchResult?.youAreHereX = youAreHereX
            fetchResult?.youAreHereY = youAreHereY
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    
    func updateTab(landId: UUID, name: String, backgroundName: String ){
        let request: NSFetchRequest<TabEntity> = TabEntity.fetchRequest()
        let filter = NSPredicate(format: "landIdW == %@", landId as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fetchResult:TabEntity?
        do {
            fetchResult = try persistentContainer.viewContext.fetch(request).first ?? TabEntity()
            fetchResult?.name = name
            fetchResult?.backgroundName = backgroundName
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    

    func updateHearts(packId: UUID, on: [Bool], count: Int, tempCount: Int){
        let request: NSFetchRequest<HeartsEntity> = HeartsEntity.fetchRequest()
        let filter = NSPredicate(format: "packIdW == %@", packId as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fetchResult:HeartsEntity?
        do {
            fetchResult = try persistentContainer.viewContext.fetch(request).first ?? HeartsEntity()
            fetchResult?.on = on
            fetchResult?.count = count
            fetchResult?.tempCount = tempCount
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    func updateWater(packId: UUID, on: [Bool], count: Int, tempCount: Int){
        let request: NSFetchRequest<WaterEntity> = WaterEntity.fetchRequest()
        let filter = NSPredicate(format: "packIdW == %@", packId as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fetchResult:WaterEntity?
        do {
            fetchResult = try persistentContainer.viewContext.fetch(request).first ?? WaterEntity()
            fetchResult?.on = on
            fetchResult?.count = count
            fetchResult?.tempCount = tempCount
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    func updateFight(landId: UUID, name:String, on: [Bool], isDead: Bool, showSpinForLootView: Bool, showDefeatedView: Bool, showDuelView: Bool) {
        let request: NSFetchRequest<FightEntity> = FightEntity.fetchRequest()
        let filter = NSPredicate(format: "landIdW == %@", landId as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fightEntity:FightEntity
        
        do {
            let fights = try persistentContainer.viewContext.fetch(request)
            fightEntity = fights.filter{$0.name == name}.first ?? FightEntity()
            fightEntity.on = on
            fightEntity.isDead = isDead
            fightEntity.showSpinForLootView = showSpinForLootView
            fightEntity.showDefeatedView = showDefeatedView
            fightEntity.showDuelView = showDuelView
            saveData()
        } catch {
            print("Fetching Failed")
        }
        
    }
    
    func updateCanvas(id: UUID,
                      landId: UUID,
                      data:Data,
                      toolColor: UIColor,
                      toolType: String,
                      toolWidth: CGFloat)
    //,toolColor:UIColor,toolWidth:CGFloat)
    {
        let request: NSFetchRequest<CanvasEntity> = CanvasEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", id as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fetchResult:CanvasEntity?
        
        do {
            fetchResult = try persistentContainer.viewContext.fetch(request).first ?? CanvasEntity()
            fetchResult?.data = data
            fetchResult?.landId = landId
            fetchResult?.toolColor = toolColor
            fetchResult?.toolType = toolType
            fetchResult?.toolWidth = toolWidth
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    func updateSpinner(id: UUID,
                       landId: UUID,
                       name: String,
                       wedgeName: String,
                       wedgeInfo: String,
                       wedgeIndex: Int,
                       wedgeAngle: Double,
                       wedgeNames: [String],
                       showInfo: Bool) {
       
        let request: NSFetchRequest<SpinnerEntity> = SpinnerEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", id as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fetchResult: SpinnerEntity?
        
        do {
            fetchResult = try persistentContainer.viewContext.fetch(request).first ?? SpinnerEntity()
            fetchResult?.id = id
            fetchResult?.landId  = landId
            fetchResult?.name  = name
            fetchResult?.wedgeName = wedgeName
            fetchResult?.wedgeInfo = wedgeInfo
            fetchResult?.wedgeIndex = wedgeIndex
            fetchResult?.wedgeAngle = wedgeAngle
            fetchResult?.wedgeNames = wedgeNames
            fetchResult?.showInfo = showInfo
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    func updateInfoWeapon(id: UUID,
                          weaponName: String,
                          weaponValue: Int,
                          attackPoints: Int) {
        
        let request: NSFetchRequest<InfoEntity> = InfoEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", id as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fetchResult: InfoEntity?
        
        do {
            fetchResult = try persistentContainer.viewContext.fetch(request).first ?? InfoEntity()
            fetchResult?.id = id
            fetchResult?.weaponName = weaponName
            fetchResult?.weaponValue = weaponValue
            fetchResult?.attackPoints = attackPoints
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    
    func updateInfoArmor(id: UUID,
                         armorName: String,
                         armorValue: Int,
                         defensePoints: Int) {
        
        let request: NSFetchRequest<InfoEntity> = InfoEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", id as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fetchResult: InfoEntity?
        
        do {
            fetchResult = try persistentContainer.viewContext.fetch(request).first ?? InfoEntity()
            fetchResult?.id = id
            fetchResult?.armorName = armorName
            fetchResult?.armorValue = armorValue
            fetchResult?.defensePoints = defensePoints
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    
    func updateInfoShield(id: UUID,
                    shieldName: String,
                    shieldValue: Int,
                    defensePoints: Int) {
        
        let request: NSFetchRequest<InfoEntity> = InfoEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", id as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fetchResult: InfoEntity?
        
        do {
            fetchResult = try persistentContainer.viewContext.fetch(request).first ?? InfoEntity()
            fetchResult?.id = id
            fetchResult?.shieldName = shieldName
            fetchResult?.shieldValue = shieldValue
            fetchResult?.defensePoints = defensePoints
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    
    func updateInfoHelm(id: UUID,
                         helmName: String,
                         helmValue: Int,
                         defensePoints: Int) {
        
        let request: NSFetchRequest<InfoEntity> = InfoEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", id as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fetchResult: InfoEntity?
        
        do {
            fetchResult = try persistentContainer.viewContext.fetch(request).first ?? InfoEntity()
            fetchResult?.id = id
            fetchResult?.helmName = helmName
            fetchResult?.helmValue = helmValue
            fetchResult?.defensePoints = defensePoints
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    
    func updateInfoLevel(id: UUID,
                         level: Int) {
        
        let request: NSFetchRequest<InfoEntity> = InfoEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", id as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fetchResult: InfoEntity?
        
        do {
            fetchResult = try persistentContainer.viewContext.fetch(request).first ?? InfoEntity()
            fetchResult?.id = id
            fetchResult?.level = level
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    
    func updateDuel(id: UUID,
                    enemyHearts: Int,
                    characterHearts: Int,
                    fightName: String,
                    showDuelView: Bool) {
        
        let request: NSFetchRequest<DuelEntity> = DuelEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", id as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fetchResult: DuelEntity?
        
        do {
            fetchResult = try persistentContainer.viewContext.fetch(request).first ?? DuelEntity()
            fetchResult?.id = id
            fetchResult?.enemyHearts = enemyHearts
            fetchResult?.characterHearts = characterHearts
            fetchResult?.fightName = fightName
            fetchResult?.showDuelView = showDuelView
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    
    func updateSettings(id: UUID,
                        packId: UUID,
                        autofill: String,
                        showCharacter: Bool) {
        
        let request: NSFetchRequest<SettingsEntity> = SettingsEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", id as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fetchResult: SettingsEntity?
        
        do {
            fetchResult = try persistentContainer.viewContext.fetch(request).first ?? SettingsEntity()
            fetchResult?.id = id
            fetchResult?.packId = packId
            fetchResult?.autofill = autofill
            fetchResult?.showCharacter = showCharacter
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
    
    func updateNavigate(id: UUID,
                        menuSelection: String) {
        
        let request: NSFetchRequest<NavigateEntity> = NavigateEntity.fetchRequest()
        let filter = NSPredicate(format: "idW == %@", id as CVarArg)
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        var fetchResult: NavigateEntity?
        
        do {
            fetchResult = try persistentContainer.viewContext.fetch(request).first ?? NavigateEntity()
            fetchResult?.menuSelection = menuSelection
            saveData()
        } catch {
            print("Fetching Failed")
        }
    }
    
}
                    
                    
            
