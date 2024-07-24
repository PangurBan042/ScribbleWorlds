//
//  SpinnerView.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 2/24/22.
//

import SwiftUI
import Spinner
import Combine

struct SpinnerContainer: View {
    
    
    var viewManager: ViewManager
    @ObservedObject var tabViewModel: TabViewModel
    @ObservedObject var landViewModel: LandViewModel
    @ObservedObject var articleViewModel: ArticleViewModel
    @ObservedObject var heartsViewModel: HeartsViewModel
    @ObservedObject var fightViewModel: FightViewModel
    var dataViewModel: DataViewModel
    @Binding var updateDuelData: Bool
    @Binding var updateViewModel: UpdateViewModel
    
    @State var futureWedge: Wedge = Wedge()
    @State var wedge: Wedge = Wedge()
    @State var alertTime: DispatchTime = DispatchTime.now()
    @State var spinnerViewModel: SpinnerViewModel = SpinnerViewModel()
    @State var duelViewModel: DuelViewModel = DuelViewModel()
    @State var alertType: String = ""
    @State var spinnerId: UUID = UUID()
    @State var spinnerName: String = ""
    @State var oldSpinnerManagerId: UUID = UUID()
    @State var oldIsSpinning: Bool = false
    @State var oldSpinnerName: String = ""
    @State var firstSpin: Bool = false
    @State var isSpinning: Bool = false
    
    
    var body: some View {
        let _ = print("In SpinnerContainer...")
        
        ZStack {
            SpinnerViewController(spinnerName: $spinnerName,
                                  spinnerId: $spinnerId,
                                  wedge: wedge,
                                  futureWedge: $futureWedge,
                                  saveData: saveData,
                                  alertType: alertType,
                                  alertTime: $alertTime,
                                  firstSpin: $firstSpin,
                                  isSpinning: $isSpinning,
                                  viewWidth: viewManager.spinnerView.spinner.width,
                                  viewHeight: viewManager.spinnerView.spinner.height)
            .frame(width:viewManager.spinnerView.spinner.width, height:viewManager.spinnerView.spinner.height, alignment: .center)
        }
        .onAppear(perform: {
            if tabViewModel.name.contains("Loot") ||
                tabViewModel.name.contains("Fight") {
                alertType = tabViewModel.name
            }
            spinnerViewModel.getData(landId:landViewModel.id, name: tabViewModel.name)
            spinnerId   = spinnerViewModel.id
            spinnerName = spinnerViewModel.name
            duelViewModel.getData(landId: tabViewModel.landId)
            futureWedge.name  = spinnerViewModel.wedgeName
            futureWedge.index = spinnerViewModel.wedgeIndex
            futureWedge.info  = spinnerViewModel.wedgeInfo
            futureWedge.showInfo = spinnerViewModel.showInfo
        })
        .onChange(of: "\(tabViewModel.name) + \(tabViewModel.landId)") {
            let _ = print("In newTab... ")
            //Get old spinnerId
           
            oldSpinnerManagerId = spinnerViewModel.id
            if isSpinning {
                oldIsSpinning = true
                oldSpinnerName = spinnerViewModel.name
            }
            if tabViewModel.name.contains("Loot") ||
                tabViewModel.name.contains("Fight") {
                alertType = tabViewModel.name
            }
            
            //Get new spinner info
            spinnerViewModel.getData(landId:tabViewModel.landId, name: tabViewModel.name)
            spinnerId   = spinnerViewModel.id
            spinnerName = spinnerViewModel.name
            futureWedge.name  = spinnerViewModel.wedgeName
            futureWedge.index = spinnerViewModel.wedgeIndex
            futureWedge.info  = spinnerViewModel.wedgeInfo
            futureWedge.showInfo = spinnerViewModel.showInfo
            firstSpin = false
            duelViewModel.getData(landId: tabViewModel.landId)
        }
        .onChange(of:updateViewModel.updateWedgeForHome) {
            oldSpinnerManagerId = spinnerViewModel.id
            saveData()
            updateViewModel.spinnerSavedTakeSnapshot.toggle()
        }
    
        .onChange(of:updateViewModel.updateWedgeForShare) {
            oldSpinnerManagerId = spinnerViewModel.id
            saveData()
            updateViewModel.spinnerSavedShareSnapshot.toggle()
        }
        .onChange(of:updateViewModel.updateTab) {
            tabViewModel.name = landViewModel.currentTab
            tabViewModel.backgroundName = landViewModel.spinnerBackground
            tabViewModel.updateData()
        }
        .onReceive(Just(alertTime)) { alertTime in
            
            if firstSpin {
                checkSpin(spinnerName: spinnerViewModel.name)
                firstSpin = false
            }
        }
        .overlay(tabViewModel.name.contains("Fight") ?
                 DuelView(viewManager:viewManager,
                          duelViewModel: duelViewModel): nil)
        .overlay(updateViewModel.animateThirsty ?
                 ThirstyView(viewManager:viewManager): nil)
        
    }
    
    func saveData() {
        let saveSpinnerViewModel = SpinnerViewModel()
        saveSpinnerViewModel.getData(id:oldSpinnerManagerId)
        saveSpinnerViewModel.wedgeInfo = wedge.info
        saveSpinnerViewModel.wedgeName = wedge.name
        saveSpinnerViewModel.wedgeIndex = wedge.index
        saveSpinnerViewModel.showInfo = wedge.showInfo
        saveSpinnerViewModel.updateData()
        if oldIsSpinning {
            checkSpin(spinnerName: oldSpinnerName)
            oldIsSpinning = false
        }
    }
    
    func checkSpin (spinnerName: String) {
        if spinnerName.contains("Loot"){
            updateArticle()
            updateViewModel.updateBackpack.toggle()
            fightViewModel.showSpinForLootView = false
            if !fightViewModel.showSpinForLootView  && fightViewModel.isDead {
                updateViewModel.resetPointsAfterOneBattle.toggle()
                fightViewModel.getData(landId: landViewModel.id, name: fightViewModel.nextFight)
                landViewModel.currentFight = fightViewModel.name
                landViewModel.updateData()
            }
            duelViewModel.enemyHearts = 0
            duelViewModel.characterHearts = 0
            duelViewModel.fightName = fightViewModel.name
            duelViewModel.updateData()
        } else if spinnerName.contains("Fight") {
            duelViewModel.enemyHearts = 0
            duelViewModel.characterHearts = 0
            if !duelViewModel.showDuelView {
                duelViewModel.showDuelView = true
            }
            
            if !fightViewModel.showSpinForLootView {
                updateDuel()
            }
            
            duelViewModel.updateData()
        }
    }
    
    func updateArticle () {
        
        
        articleViewModel.getData(packId:landViewModel.packId, name:wedge.name)
        updateViewModel.animateBackpack = true
        
        let index = articleViewModel.collected.firstIndex{$0 == false}
        if  index != nil {
            articleViewModel.collected[index!] = true
            if !articleViewModel.permanent {
                articleViewModel.on[index!] = true }
            
        }
        DispatchQueue.main.asyncAfter(deadline:DispatchTime.now() + 0.5){
            updateViewModel.animateBackpack = false
        }
    }
    
    
    func updateDuel() {
        let _ = print("In SpinnView/updateDuel....")
        var spunAttackPoints = 0
        var spunDefensePoints = 0
        var enemyHeartIndex =  -1
        
        duelViewModel.fightName = fightViewModel.name
        if fightViewModel.count > 0 {
            enemyHeartIndex = fightViewModel.count - 1
        }
        
        var yourHeartIndex = -1
        if heartsViewModel.count > 0   {
            yourHeartIndex = heartsViewModel.count - 1
        }
        
        if wedge.imageName.contains("Attack") {
            spunAttackPoints = wedge.value
            spunDefensePoints = 0
        } else if wedge.imageName.contains("Defense") {
            spunDefensePoints = wedge.value
            spunAttackPoints = 0
        }
        
        
        var enemyHearts = fightViewModel.defensePoints - (dataViewModel.characterAttackPoints + spunAttackPoints)
       
        if duelViewModel.showDuelView && !fightViewModel.showDefeatedView && !updateViewModel.characterIsDead {
            if enemyHearts >= 0  { enemyHearts = 0} else
            {
                var absEnemyHearts = abs(enemyHearts)
                if absEnemyHearts > (enemyHeartIndex + 1) {
                    absEnemyHearts = enemyHeartIndex + 1
                }
                for index in 0 ... (absEnemyHearts - 1) {
                    fightViewModel.on[enemyHeartIndex - Int(index)] = false
                }
                duelViewModel.enemyHearts = enemyHearts
                duelViewModel.updateData()
                fightViewModel.count = fightViewModel.on.filter{$0 == true}.count
            
                
                if fightViewModel.count <= 0 {
                    fightViewModel.isDead = true
                    if fightViewModel.nextFight != "Defeated" {
                        fightViewModel.showSpinForLootView = true
                        articleViewModel.getData(packId:landViewModel.packId, name:fightViewModel.article)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2)
                        {
                            updateViewModel.animateBackpack = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                updateViewModel.animateBackpack = false
                            }
                        }
                        let index = articleViewModel.on.firstIndex{$0 == false}
                        if index != nil {
                            articleViewModel.collected[index!] = true
                            if articleViewModel.category  != "Weapon" &&
                                articleViewModel.category != "Armor" &&
                                articleViewModel.category != "Shield" &&
                                articleViewModel.category != "Helm" {
                                articleViewModel.on[index!] = true
                            }
                        }
                    } else {
                        fightViewModel.showDefeatedView.toggle()
                        fightViewModel.isDead = true
                       
                    }
                }
            }
            updateViewModel.resetPointsAfterOneBattle.toggle()
            
            var yourHearts =  (dataViewModel.characterDefensePoints + spunDefensePoints) - fightViewModel.attackPoints
            if yourHearts >= 0 || yourHeartIndex < 0 { yourHearts = 0} else {
                
                var absYourHearts = abs(yourHearts)
                if absYourHearts > (yourHeartIndex + 1) {
                    absYourHearts = yourHeartIndex + 1
                }
                
                for index in 0 ... (absYourHearts - 1) {
                    heartsViewModel.on[yourHeartIndex - Int(index)] = false
                    
                }
                duelViewModel.characterHearts = yourHearts
                duelViewModel.updateData()
                heartsViewModel.count = heartsViewModel.on.filter{$0 == true}.count
                heartsViewModel.tempCount = heartsViewModel.count
                heartsViewModel.updateData()
                
                if heartsViewModel.count == 0 {
                    updateViewModel.characterIsDead = true
                    
                }
            }
            
        }
    }
}




struct SpinnerView: View {
    
    
    
    @ObservedObject var viewManager: ViewManager
    @ObservedObject var landViewModel: LandViewModel
    @ObservedObject var articleViewModel: ArticleViewModel
    @ObservedObject var infoViewModel: InfoViewModel
    @ObservedObject var heartsViewModel: HeartsViewModel
    @ObservedObject var fightViewModel: FightViewModel
    var dataViewModel: DataViewModel
    @Binding var updateViewModel: UpdateViewModel
    @StateObject var tabViewModel: TabViewModel
    @Binding var currentLand: String
    @State var updateDuelData: Bool = false
    
    
    
    init(viewManager:ViewManager,
         landViewModel: LandViewModel,
         articleViewModel: ArticleViewModel,
         infoViewModel: InfoViewModel,
         heartsViewModel: HeartsViewModel,
         fightViewModel: FightViewModel,
         dataViewModel: DataViewModel,
         updateViewModel: Binding<UpdateViewModel>,
         currentLand: Binding<String>) {
        self.viewManager = viewManager
        self.landViewModel = landViewModel
        self.articleViewModel = articleViewModel
        self.infoViewModel = infoViewModel
        self.heartsViewModel = heartsViewModel
        self.fightViewModel = fightViewModel
        self.dataViewModel = dataViewModel
        self._updateViewModel = updateViewModel
        self._currentLand = currentLand
       
        
        _tabViewModel = StateObject(wrappedValue: { TabViewModel(landId:landViewModel.id) }())
        
    }
    
    
    var body: some View {
        
        let _ = print("In SpinnerView...")
        HStack {
            Spacer()
            
            
            StatsView(viewManager: viewManager,
                      infoViewModel: infoViewModel,
                      updateViewModel: $updateViewModel)
            
            TabAndSpinnerView(viewManager: viewManager,
                              landViewModel: landViewModel,
                              articleViewModel: articleViewModel,
                              tabViewModel: tabViewModel,
                              heartsViewModel: heartsViewModel,
                              fightViewModel: fightViewModel,
                              dataViewModel: dataViewModel,
                              updateDuelData: $updateDuelData,
                              updateViewModel: $updateViewModel)
            
            
        }
        
        .frame(width:viewManager.spinnerView.width, height:viewManager.spinnerView.height)
        .onChange(of:"\(landViewModel.id)") {
            tabViewModel.getData(landId: landViewModel.id)
        }
        .onChange(of:landViewModel.spinForLootOn){
            tabViewModel.name = landViewModel.currentTab
            tabViewModel.backgroundName = landViewModel.spinnerBackground
        }
        .onChange(of: "\(tabViewModel.name) + \(tabViewModel.id)"){
            updateViewModel.resetTempOverlay.toggle()
            landViewModel.currentTab = tabViewModel.backgroundName
            landViewModel.updateData()
        }
        .onChange(of: updateDuelData) {
            infoViewModel.level += 1
        }
    }
}
//        .onChange(of:spinnerManager.wedgeInfo) {
//            if spinnerManager.wedgeInfo.contains("Color") {
//                DispatchQueue.main.asyncAfter(deadline: lastSpinDate)
//                {
//                    wedgeColor = UIColor(hex: spinnerManager.wedgeInfo) ?? UIColor()
//                }
//            }
//        }





public extension View {
    
    func fullBackground(imageName: String) -> some View {
        let backgroundImage =  (UIImage(named: imageName) ?? UIImage(named: "spinnerDefault.png"))!
        return background(Image(uiImage:backgroundImage)
            .resizable())
    }
    
}

public extension View {
    
    func fullBackground(imageName: String, width: Double, height: Double) -> some View {
        
        
        guard let image = downsample(imageName: imageName, to:  (CGSize(width: width, height: height))) else {
            let image = UIImage()
            return background(Image(uiImage:image )
                .resizable())
        }
        
        return background(Image(uiImage:image )
            .resizable())
        
    }
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b: CGFloat
        
        if hex.hasPrefix("Color #") {
            let start = hex.index(hex.startIndex, offsetBy: 7)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    b = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: 1.0)
                    return
                    
                }
            }
        }
        
        return nil
    }
}


struct TabAndSpinnerView: View{
    @ObservedObject var viewManager: ViewManager
    @ObservedObject var landViewModel: LandViewModel
    @ObservedObject var articleViewModel: ArticleViewModel
    @ObservedObject var tabViewModel: TabViewModel
    @ObservedObject var heartsViewModel: HeartsViewModel
    @ObservedObject var fightViewModel: FightViewModel
    var dataViewModel: DataViewModel
    
    @Binding var updateDuelData: Bool
    @Binding var updateViewModel: UpdateViewModel
    
    
    
    
    init(viewManager:ViewManager,
         landViewModel: LandViewModel,
         articleViewModel: ArticleViewModel,
         tabViewModel: TabViewModel,
         heartsViewModel: HeartsViewModel,
         fightViewModel: FightViewModel,
         dataViewModel: DataViewModel,
         updateDuelData: Binding<Bool>,
         updateViewModel: Binding<UpdateViewModel>) {
        self.viewManager = viewManager
        self.landViewModel = landViewModel
        self.articleViewModel = articleViewModel
        self.tabViewModel = tabViewModel
        self.heartsViewModel = heartsViewModel
        self.fightViewModel = fightViewModel
        self.dataViewModel = dataViewModel
        self._updateDuelData = updateDuelData
        self._updateViewModel = updateViewModel
        
    }
    
    var body: some View {
        
        let _ = print("In TabAndSpinnerView...")
        
        ZStack (alignment: .trailing)            {
            
            TabsView(viewManager: viewManager,
                     tabViewModel: tabViewModel)
            .frame( height:viewManager.spinnerView.height)
            
            HStack (alignment: .center, spacing:0) {
                
                SpinnerContainer(viewManager: viewManager,
                                 tabViewModel: tabViewModel,
                                 landViewModel: landViewModel,
                                 articleViewModel: articleViewModel,
                                 heartsViewModel: heartsViewModel,
                                 fightViewModel: fightViewModel,
                                 dataViewModel: dataViewModel,
                                 updateDuelData: $updateDuelData,
                                 updateViewModel: $updateViewModel)
                
                Spacer()
            }
        }
    }
}



////
////  SpinnerView.swift
////  ScribbleWorlds
////
////  Created by Franny Moyse on 2/24/22.
////
//
//import SwiftUI
//import Spinner
//import Combine
//
//struct SpinnerContainer: View {
//    
//    
//    var viewManager: ViewManager
//    @ObservedObject var tabViewModel: TabViewModel
//    @ObservedObject var landViewModel: LandViewModel
//    @ObservedObject var articleViewModel: ArticleViewModel
//    @ObservedObject var heartsViewModel: HeartsViewModel
//    @ObservedObject var fightViewModel: FightViewModel
//    var dataViewModel: DataViewModel
//    @Binding var updateDuelData: Bool
//    @Binding var updateViewModel: UpdateViewModel
//    
//    @State var futureWedge: Wedge = Wedge()
//    @State var wedge: Wedge = Wedge()
//    @State var alertTime: DispatchTime = DispatchTime.now()
//    @State var spinnerViewModel: SpinnerViewModel = SpinnerViewModel()
//    @State var duelViewModel: DuelViewModel = DuelViewModel()
//    @State var alertType: String = ""
//    @State var spinnerId: UUID = UUID()
//    @State var spinnerName: String = ""
//    @State var oldSpinnerManagerId: UUID = UUID()
//    @State var oldIsSpinning: Bool = false
//    @State var oldSpinnerName: String = ""
//    @State var firstSpin: Bool = false
//    @State var isSpinning: Bool = false
//    
//    
//    var body: some View {
//        let _ = print("In SpinnerContainer...")
//        
//        ZStack {
//            SpinnerViewController(spinnerName: $spinnerName,
//                                  spinnerId: $spinnerId,
//                                  wedge: wedge,
//                                  futureWedge: $futureWedge,
//                                  saveData: saveData,
//                                  alertType: alertType,
//                                  alertTime: $alertTime,
//                                  firstSpin: $firstSpin,
//                                  isSpinning: $isSpinning,
//                                  viewWidth: viewManager.spinnerView.spinner.width,
//                                  viewHeight: viewManager.spinnerView.spinner.height)
//            .frame(width:viewManager.spinnerView.spinner.width, height:viewManager.spinnerView.spinner.height, alignment: .center)
//        }
//        .onAppear(perform: {
//            if tabViewModel.name.contains("Loot") ||
//                tabViewModel.name.contains("Fight") {
//                alertType = tabViewModel.name
//            }
//            spinnerViewModel.getData(landId:landViewModel.id, name: tabViewModel.name)
//            spinnerId   = spinnerViewModel.id
//            spinnerName = spinnerViewModel.name
//            duelViewModel.getData(landId: tabViewModel.landId)
//            futureWedge.name  = spinnerViewModel.wedgeName
//            futureWedge.index = spinnerViewModel.wedgeIndex
//            futureWedge.info  = spinnerViewModel.wedgeInfo
//            futureWedge.showInfo = spinnerViewModel.showInfo
//        })
//        .onChange(of: "\(tabViewModel.name) + \(tabViewModel.landId)") {
//            let _ = print("")
//            //Get old spinnerId
//            oldSpinnerManagerId = spinnerViewModel.id
//            if isSpinning {
//                oldIsSpinning = true
//                oldSpinnerName = spinnerViewModel.name
//            }
//            if tabViewModel.name.contains("Loot") ||
//                tabViewModel.name.contains("Fight") {
//                alertType = tabViewModel.name
//            }
//            
//            //Get new spinner info
//            spinnerViewModel.getData(landId:tabViewModel.landId, name: tabViewModel.name)
//            spinnerId   = spinnerViewModel.id
//            spinnerName = spinnerViewModel.name
//            futureWedge.name  = spinnerViewModel.wedgeName
//            futureWedge.index = spinnerViewModel.wedgeIndex
//            futureWedge.info  = spinnerViewModel.wedgeInfo
//            futureWedge.showInfo = spinnerViewModel.showInfo
//            firstSpin = false
//            duelViewModel.getData(landId: tabViewModel.landId)
//        }
//        .onChange(of:updateViewModel.updateWedgeForHome) {
//            oldSpinnerManagerId = spinnerViewModel.id
//            saveData()
//            updateViewModel.spinnerSavedTakeSnapshot.toggle()
//        }
//    
//        .onChange(of:updateViewModel.updateWedgeForShare) {
//            oldSpinnerManagerId = spinnerViewModel.id
//            saveData()
//            updateViewModel.spinnerSavedShareSnapshot.toggle()
//        }
//        .onChange(of:updateViewModel.updateTab) {
//            tabViewModel.name = landViewModel.currentTab
//            tabViewModel.backgroundName = landViewModel.spinnerBackground
//            tabViewModel.updateData()
//        }
//        
//        
//        .onReceive(Just(alertTime)) { alertTime in
//            
//            if firstSpin {
//                checkSpin(spinnerName: spinnerViewModel.name)
//                firstSpin = false
//            }
//        }
//        .overlay(tabViewModel.name.contains("Fight") ?
//                 DuelView(viewManager:viewManager,
//                          duelViewModel: duelViewModel): nil)
//        .overlay(updateViewModel.animateThirsty ?
//                 ThirstyView(viewManager:viewManager): nil)
//        
//    }
//    
//    func saveData() {
//        let saveSpinnerViewModel = SpinnerViewModel()
//        saveSpinnerViewModel.getData(id:oldSpinnerManagerId)
//        saveSpinnerViewModel.wedgeInfo = wedge.info
//        saveSpinnerViewModel.wedgeName = wedge.name
//        saveSpinnerViewModel.wedgeIndex = wedge.index
//        saveSpinnerViewModel.showInfo = wedge.showInfo
//        saveSpinnerViewModel.updateData()
//        if oldIsSpinning {
//            checkSpin(spinnerName: oldSpinnerName)
//            oldIsSpinning = false
//        }
//    }
//    
//    func checkSpin (spinnerName: String) {
//        if spinnerName.contains("Loot"){
//            updateArticle()
//            updateViewModel.updateBackpack.toggle()
//            fightViewModel.showSpinForLootView = false
//            if !fightViewModel.showSpinForLootView {
//                fightViewModel.getData(landId: landViewModel.id, name: fightViewModel.nextFight)
//                landViewModel.currentFight = fightViewModel.name
//            }
//            duelViewModel.enemyHearts = 0
//            duelViewModel.characterHearts = 0
//            duelViewModel.fightName = fightViewModel.name
//            duelViewModel.updateData()
//        } else if spinnerName.contains("Fight") {
//            duelViewModel.enemyHearts = 0
//            duelViewModel.characterHearts = 0
//            if !duelViewModel.showDuelView {
//                duelViewModel.showDuelView = true
//            }
//            
//            if !fightViewModel.showSpinForLootView {
//                updateDuel()
//            }
//            
//            duelViewModel.updateData()
//            setArticles()
//        } else {
//            setArticles()
//        }
//    }
//    
//    func updateArticle () {
//        
//        
//        articleViewModel.getData(packId:landViewModel.packId, name:wedge.name)
//        updateViewModel.animateBackpack = true
//        
//        let index = articleViewModel.collected.firstIndex{$0 == false}
//        if  index != nil {
//            articleViewModel.collected[index!] = true
//            if !articleViewModel.permanent {
//                articleViewModel.on[index!] = true }
//            
//        }
//        DispatchQueue.main.asyncAfter(deadline:DispatchTime.now() + 0.5){
//            updateViewModel.animateBackpack = false
//        }
//    }
//    
//    func setArticles () {
//        
//        if landViewModel.currentArticles.count > 1  {
//            for name in landViewModel.currentArticles {
//                if name != "" {
//                    articleViewModel.getData(packId:landViewModel.packId, name: name)
//                    articleViewModel.collected = articleViewModel.on
//                    
//                }
//                
//            }
//            landViewModel.currentArticles = [""]
//            updateViewModel.health.tempCount = updateViewModel.health.count
//        }
//    }
//    
//    
//    func updateDuel() {
//        var bonusAttackPoints = 0
//        var bonusDefensePoints = 0
//        var enemyHeartIndex =  -1
//        
//        duelViewModel.fightName = fightViewModel.name
//        if fightViewModel.count > 0 {
//            enemyHeartIndex = fightViewModel.count - 1
//        }
//        
//        var yourHeartIndex = -1
//        if heartsViewModel.count > 0   {
//            yourHeartIndex = heartsViewModel.count - 1
//        }
//        
//        if wedge.imageName.contains("Attack") {
//            bonusAttackPoints = wedge.value
//            bonusDefensePoints = 0
//        } else if wedge.imageName.contains("Defense") {
//            bonusDefensePoints = wedge.value
//            bonusAttackPoints = 0
//        }
//        
//        
//        var enemyHearts = fightViewModel.defensePoints - (dataViewModel.characterAttackPoints + bonusAttackPoints)
//        if duelViewModel.showDuelView && !fightViewModel.showDefeatedView && !updateViewModel.characterIsDead {
//            if enemyHearts >= 0  { enemyHearts = 0} else
//            {
//                var absEnemyHearts = abs(enemyHearts)
//                if absEnemyHearts > (enemyHeartIndex + 1) {
//                    absEnemyHearts = enemyHeartIndex + 1
//                }
//                for index in 0 ... (absEnemyHearts - 1) {
//                    fightViewModel.on[enemyHeartIndex - Int(index)] = false
//                }
//                duelViewModel.enemyHearts = enemyHearts
//                duelViewModel.updateData()
//                fightViewModel.count = fightViewModel.on.filter{$0 == true}.count
//            
//                
//                if fightViewModel.count <= 0 {
//                    fightViewModel.isDead = true
//                    if fightViewModel.nextFight != "Defeated" {
//                        fightViewModel.showSpinForLootView = true
//                        articleViewModel.getData(packId:landViewModel.packId, name:fightViewModel.article)
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2)
//                        {
//                            updateViewModel.animateBackpack = true
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                                updateViewModel.animateBackpack = false
//                            }
//                        }
//                        let index = articleViewModel.on.firstIndex{$0 == false}
//                        if index != nil {
//                            articleViewModel.collected[index!] = true
//                            if articleViewModel.category  != "Weapon" &&
//                                articleViewModel.category != "Armor" &&
//                                articleViewModel.category != "Shield" &&
//                                articleViewModel.category != "Helm" {
//                                articleViewModel.on[index!] = true
//                            }
//                        }
//                    } else {
//                        fightViewModel.showDefeatedView.toggle()
//                        fightViewModel.isDead = true
//                    }
//                }
//            }
//            
//            
//            var yourHearts =  (dataViewModel.characterDefensePoints + bonusDefensePoints) - fightViewModel.attackPoints
//            if yourHearts >= 0 || yourHeartIndex < 0 { yourHearts = 0} else {
//                
//                var absYourHearts = abs(yourHearts)
//                if absYourHearts > (yourHeartIndex + 1) {
//                    absYourHearts = yourHeartIndex + 1
//                }
//                
//                for index in 0 ... (absYourHearts - 1) {
//                    heartsViewModel.on[yourHeartIndex - Int(index)] = false
//                    
//                }
//                duelViewModel.characterHearts = yourHearts
//                duelViewModel.updateData()
//                heartsViewModel.count = heartsViewModel.on.filter{$0 == true}.count
//                heartsViewModel.tempCount = heartsViewModel.count
//                heartsViewModel.updateData()
//                
//                if heartsViewModel.count == 0 {
//                    updateViewModel.characterIsDead = true
//                }
//            }
//            
//        }
//    }
//}
//
//
//
//
//struct SpinnerView: View {
//    
//    
//    
//    @ObservedObject var viewManager: ViewManager
//    @ObservedObject var landViewModel: LandViewModel
//    @ObservedObject var articleViewModel: ArticleViewModel
//    @ObservedObject var infoViewModel: InfoViewModel
//    @ObservedObject var heartsViewModel: HeartsViewModel
//    @ObservedObject var fightViewModel: FightViewModel
//    var dataViewModel: DataViewModel
//    @Binding var updateViewModel: UpdateViewModel
//    @StateObject var tabViewModel: TabViewModel
//    @Binding var currentLand: String
//    @State var updateDuelData: Bool = false
//    
//    
//    
//    init(viewManager:ViewManager,
//         landViewModel: LandViewModel,
//         articleViewModel: ArticleViewModel,
//         infoViewModel: InfoViewModel,
//         heartsViewModel: HeartsViewModel,
//         fightViewModel: FightViewModel,
//         dataViewModel: DataViewModel,
//         updateViewModel: Binding<UpdateViewModel>,
//         currentLand: Binding<String>) {
//        self.viewManager = viewManager
//        self.landViewModel = landViewModel
//        self.articleViewModel = articleViewModel
//        self.infoViewModel = infoViewModel
//        self.heartsViewModel = heartsViewModel
//        self.fightViewModel = fightViewModel
//        self.dataViewModel = dataViewModel
//        self._updateViewModel = updateViewModel
//        self._currentLand = currentLand
//       
//        
//        _tabViewModel = StateObject(wrappedValue: { TabViewModel(landId:landViewModel.id) }())
//        
//    }
//    
//    
//    var body: some View {
//        
//        let _ = print("In SpinnerView...")
//        HStack {
//            Spacer()
//            
//            
//            StatsView(viewManager: viewManager,
//                      infoViewModel: infoViewModel)
//            
//            TabAndSpinnerView(viewManager: viewManager,
//                              landViewModel: landViewModel,
//                              articleViewModel: articleViewModel,
//                              tabViewModel: tabViewModel,
//                              heartsViewModel: heartsViewModel,
//                              fightViewModel: fightViewModel,
//                              dataViewModel: dataViewModel,
//                              updateDuelData: $updateDuelData,
//                              updateViewModel: $updateViewModel)
//            
//            
//        }
//        
//        .frame(width:viewManager.spinnerView.width, height:viewManager.spinnerView.height)
//        .onChange(of:"\(landViewModel.id)") {
//            tabViewModel.getData(landId: landViewModel.id)
//        }
//        .onChange(of:landViewModel.spinForLootOn){
//            tabViewModel.name = landViewModel.currentTab
//            tabViewModel.backgroundName = landViewModel.spinnerBackground
//        }
//        .onChange(of: "\(tabViewModel.name) + \(tabViewModel.id)"){
//            landViewModel.currentTab = tabViewModel.backgroundName
//            if tabViewModel.name.contains("Fight") {
//                landViewModel.overlayTabName = "Fight"
//            } else if tabViewModel.name.contains("Loot") {
//                landViewModel.overlayTabName = "Loot"
//            } else {
//                if landViewModel.overlayTabName != "" { landViewModel.overlayTabName = "" }
//                updateViewModel.resetTempOverlay.toggle()
//            }
//            landViewModel.updateData()
//        }
//        .onChange(of: updateDuelData) {
//            infoViewModel.level += 1
//        }
//    }
//}
////        .onChange(of:spinnerManager.wedgeInfo) {
////            if spinnerManager.wedgeInfo.contains("Color") {
////                DispatchQueue.main.asyncAfter(deadline: lastSpinDate)
////                {
////                    wedgeColor = UIColor(hex: spinnerManager.wedgeInfo) ?? UIColor()
////                }
////            }
////        }
//
//
//
//
//
//public extension View {
//    
//    func fullBackground(imageName: String) -> some View {
//        let backgroundImage =  (UIImage(named: imageName) ?? UIImage(named: "spinnerDefault.png"))!
//        return background(Image(uiImage:backgroundImage)
//            .resizable())
//    }
//    
//}
//
//public extension View {
//    
//    func fullBackground(imageName: String, width: Double, height: Double) -> some View {
//        
//        
//        guard let image = downsample(imageName: imageName, to:  (CGSize(width: width, height: height))) else {
//            let image = UIImage()
//            return background(Image(uiImage:image )
//                .resizable())
//        }
//        
//        return background(Image(uiImage:image )
//            .resizable())
//        
//    }
//}
//
//extension UIColor {
//    public convenience init?(hex: String) {
//        let r, g, b: CGFloat
//        
//        if hex.hasPrefix("Color #") {
//            let start = hex.index(hex.startIndex, offsetBy: 7)
//            let hexColor = String(hex[start...])
//            
//            if hexColor.count == 6 {
//                let scanner = Scanner(string: hexColor)
//                var hexNumber: UInt64 = 0
//                
//                if scanner.scanHexInt64(&hexNumber) {
//                    r = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
//                    g = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
//                    b = CGFloat(hexNumber & 0x000000ff) / 255
//                    
//                    self.init(red: r, green: g, blue: b, alpha: 1.0)
//                    return
//                    
//                }
//            }
//        }
//        
//        return nil
//    }
//}
//
//
//struct TabAndSpinnerView: View{
//    @ObservedObject var viewManager: ViewManager
//    @ObservedObject var landViewModel: LandViewModel
//    @ObservedObject var articleViewModel: ArticleViewModel
//    @ObservedObject var tabViewModel: TabViewModel
//    @ObservedObject var heartsViewModel: HeartsViewModel
//    @ObservedObject var fightViewModel: FightViewModel
//    var dataViewModel: DataViewModel
//    
//    @Binding var updateDuelData: Bool
//    @Binding var updateViewModel: UpdateViewModel
//    
//    
//    
//    
//    init(viewManager:ViewManager,
//         landViewModel: LandViewModel,
//         articleViewModel: ArticleViewModel,
//         tabViewModel: TabViewModel,
//         heartsViewModel: HeartsViewModel,
//         fightViewModel: FightViewModel,
//         dataViewModel: DataViewModel,
//         updateDuelData: Binding<Bool>,
//         updateViewModel: Binding<UpdateViewModel>) {
//        self.viewManager = viewManager
//        self.landViewModel = landViewModel
//        self.articleViewModel = articleViewModel
//        self.tabViewModel = tabViewModel
//        self.heartsViewModel = heartsViewModel
//        self.fightViewModel = fightViewModel
//        self.dataViewModel = dataViewModel
//        self._updateDuelData = updateDuelData
//        self._updateViewModel = updateViewModel
//        
//    }
//    
//    var body: some View {
//        
//        let _ = print("In TabAndSpinnerView...")
//        
//        ZStack (alignment: .trailing)            {
//            
//            TabsView(viewManager: viewManager,
//                     tabViewModel: tabViewModel)
//            .frame( height:viewManager.spinnerView.height)
//            
//            HStack (alignment: .center, spacing:0) {
//                
//                SpinnerContainer(viewManager: viewManager,
//                                 tabViewModel: tabViewModel,
//                                 landViewModel: landViewModel,
//                                 articleViewModel: articleViewModel,
//                                 heartsViewModel: heartsViewModel,
//                                 fightViewModel: fightViewModel,
//                                 dataViewModel: dataViewModel,
//                                 updateDuelData: $updateDuelData,
//                                 updateViewModel: $updateViewModel)
//                
//                Spacer()
//            }
//        }
//    }
//}
