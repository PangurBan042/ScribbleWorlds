//
//  Model.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 12/1/21.
//

import Foundation

public class ViewModel {
    
    public var isFirstResponder: Bool = true
    public var isImageRenderer: Bool = false
    
    public struct NewView {
        var headerHeight:Double = 0.0
        var adventureHeaderHeight:Double = 0.0
        var creatingHeaderHeight:Double = 0.0
        var scrollAreaHeight:Double = 0.0
        var scrollAreaWidth:Double = 0.0
        var bottomPadding:Double = 0.0
        var sidePadding:Double = 0.0
        
        public struct Image {
            var width: Double
            var height: Double
        }
        var image = Image(width:0.0, height:0.0)
        
        public struct Title {
            var width: Double
            var height: Double
        }
        var title = Title(width:0.0, height:0.0)
        
        public struct Delete {
            var width: Double
            var height: Double
        }
        var delete = Delete(width:0.0, height:0.0)
        
        
    }
    
    public struct GridView {
        
        public struct Grid {
            var cellDim: Double
            var frameDim: Double
            var gridSize: Double
           
        }
       
        var grid = Grid(cellDim: 0.0, frameDim: 0.0, gridSize: 10.0)
     }
    
    public struct SpinnerView {
       
        var width: Double = 0.0
        var height: Double = 0.0
        var padding:Double = 0.0
        
        public struct Stats {
            var width: Double
            var height: Double
            var columnPadding: Double
            var rowPadding: Double
            var levelNameWidth: Double
            var levelNameHeight: Double
            var pointsWidth: Double
            var pointsHeight: Double
            var toolTypeWidth: Double
            var toolTypeHeight: Double
            var toolNameWidth: Double
            var toolNameHeight: Double
            var toolImageWidth: Double
            var toolImageHeight: Double
        }
        
        public struct Spinner {
            var width: Double
            var height: Double
        }
        
        public struct Tab {
            var width: Double
            var height: Double
            var x: Double
            var y: Double
            var widthPerTab: Double
            var heightPerTab: Double
        }
        var stats = Stats(width:0.0, height: 0.0, columnPadding: 0.0, rowPadding: 0.0, levelNameWidth: 0.0, levelNameHeight: 0.0, pointsWidth: 0.0, pointsHeight: 0.0, toolTypeWidth: 0.0, toolTypeHeight: 0.0, toolNameWidth: 0.0, toolNameHeight: 0.0, toolImageWidth: 0.0, toolImageHeight: 0.0)
        var spinner = Spinner(width:0.0, height: 0.0)
        var tab = Tab(width: 0.0, height: 0.0, x: 0.0, y: 0.0, widthPerTab: 0.0, heightPerTab: 0.0)
        
     }
    
    public struct NavigateView {
         var width: Double
         var height: Double
        
        public struct LeftArrow {
            var width: Double
            var height: Double
        }
        var leftArrow  = LeftArrow(width:0.0, height: 0.0)
        
        public struct IconPadding {
            var width: Double
            var height: Double
        }
        var iconPadding  = IconPadding(width:0.0, height: 0.0)
        
        public struct BackPack {
            var width: Double
            var height: Double
        }
        var backpack  = BackPack(width:0.0, height: 0.0)
        
        public struct Book {
            var width: Double
            var height: Double
        }
        var book  = Book(width:0.0, height: 0.0)
        
        public struct Help {
            var width: Double
            var height: Double
        }
        var help  = Help(width:0.0, height: 0.0)
        
        public struct Stats {
            var width: Double
            var height: Double
        }
        var stats  = Stats(width:0.0, height: 0.0)
        
        public struct BeforeStatsPadding {
            var width: Double
            var height: Double
        }
        var beforeStatsPadding  = BeforeStatsPadding(width:0.0, height: 0.0)
        
        public struct AfterStatsPadding {
            var width: Double
            var height: Double
        }
        var afterStatsPadding  = AfterStatsPadding(width:0.0, height: 0.0)
        
        public struct StatsIcon {
            var width: Double
            var height: Double
        }
        var statsIcon  = StatsIcon(width:0.0, height: 0.0)
        
        public struct Share {
            var width: Double
            var height: Double
        }
        var share  = Share(width:0.0, height: 0.0)
        
        public struct Gear {
            var width: Double
            var height: Double
        }
        var gear  = Gear(width:0.0, height: 0.0)
        
        public struct Home {
            var width: Double
            var height: Double
        }
        var home  = Home(width:0.0, height: 0.0)
        
        public struct RightArrow {
            var width: Double
            var height: Double
        }
        var rightArrow  = RightArrow(width:0.0, height: 0.0)
     }
    
    public struct GoalView {
    
        var width: Double
        var height: Double
       
       public struct Title {
           var width: Double
           var height: Double
       }
       var title  = Title(width:0.0, height: 0.0)
       
       public struct TitlePadding {
           var width: Double
           var height: Double
       }
       var titlePadding  = TitlePadding(width:0.0, height: 0.0)
        
        public struct Checkbox {
            var width: Double
            var height: Double
        }
        var checkbox  = Checkbox(width:0.0, height: 0.0)
       
       public struct Column {
           var width: Double
           var height: Double
       }
       var column  = Column(width:0.0, height: 0.0)
       
       public struct ColumnPadding {
           var width: Double
           var height: Double
       }
       var columnPadding  = ColumnPadding(width:0.0, height: 0.0)
       
     }
    
    public struct FightView {
        
        var width: Double
        var height: Double
        
        public struct Padding {
            var width: Double
            var height: Double
        }
        var padding  = Padding(width:0.0, height: 0.0)
        
        public struct Name {
            var width: Double
            var height: Double
        }
        var name  = Name(width:0.0, height: 0.0)
        
        public struct MajorFight {
            var width: Double
            var height: Double
        }
        var majorFight  = MajorFight(width:0.0, height: 0.0)
        
        public struct MinorFight {
            var width: Double
            var height: Double
        }
        var minorFight  = MinorFight(width:0.0, height: 0.0)
        
        public struct MajorFightImage {
            var width: Double
            var height: Double
        }
        var majorFightImage  = MajorFightImage(width:0.0, height: 0.0)
        
        public struct MajorFightData {
            var width: Double
            var height: Double
        }
        var majorFightData = MajorFightData(width:0.0, height: 0.0)
        
        public struct MajorFightAndTitle {
            var width: Double
            var height: Double
        }
        var majorFightAndTitle = MajorFightAndTitle(width:0.0, height: 0.0)
        
        public struct MajorFightPadding {
            var width: Double
            var height: Double
        }
        var majorFightPadding = MajorFightPadding(width:0.0, height: 0.0)
        
        public struct MajorFightInfo {
            var width: Double
            var height: Double
        }
        var majorFightInfo  = MajorFightInfo(width:0.0, height: 0.0)
        
        public struct MajorFightLife {
            var width: Double
            var height: Double
        }
        var majorFightLife  = MajorFightLife(width:0.0, height: 0.0)
        
        public struct MinorFightHeading {
            var width: Double
            var height: Double
        }
        var minorFightHeading  = MinorFightHeading(width:0.0, height: 0.0)
        
        public struct MinorFightImage {
            var width: Double
            var height: Double
        }
        var minorFightImage  = MinorFightImage(width:0.0, height: 0.0)
        
        public struct MinorFightName {
            var width: Double
            var height: Double
        }
        var minorFightName = MinorFightName(width:0.0, height: 0.0)
        
        public struct MinorFightLife {
            var width: Double
            var height: Double
        }
        var minorFightLife  = MinorFightLife(width:0.0, height: 0.0)
        
    }
    
    
    
    
    
    
    
    public struct SpinForLootView {
        
        var width: Double
        var height: Double
        
        public struct Padding {
            var width: Double
            var height: Double
        }
        var padding  = Padding(width:0.0, height: 0.0)
        
        public struct Congrats{
            var width: Double
            var height: Double
        }
        var congrats  = Congrats(width:0.0, height: 0.0)
        
        public struct FightImage {
            var width: Double
            var height: Double
        }
        var fightImage  = FightImage(width:0.0, height: 0.0)
        
        public struct FightName {
            var width: Double
            var height: Double
        }
        var fightName  = FightName(width:0.0, height: 0.0)
        
        public struct BestowItem {
            var width: Double
            var height: Double
        }
        var bestowItem  = BestowItem(width:0.0, height: 0.0)
        
        public struct ItemName {
            var width: Double
            var height: Double
        }
        var itemName  = ItemName(width:0.0, height: 0.0)
        
        public struct ItemImage {
            var width: Double
            var height: Double
        }
        var itemImage  = ItemImage(width:0.0, height: 0.0)
        
        public struct ItemInfo {
            var width: Double
            var height: Double
        }
        var itemInfo  = ItemInfo(width:0.0, height: 0.0)
        
        public struct TapAndSpin {
            var width: Double
            var height: Double
        }
        var tapAndSpin  = TapAndSpin(width:0.0, height: 0.0)
    }
    
    public struct BackpackView {
        
        var width: Double
        var height: Double
        
        public struct Padding {
            var width: Double
            var height: Double
        }
        var padding  = Padding(width:0.0, height: 0.0)
        
        public struct Title {
            var width: Double
            var height: Double
        }
        var title  = Title(width:0.0, height: 0.0)
        
        public struct Name {
            var width: Double
            var height: Double
        }
        var name  = Name(width:0.0, height: 0.0)
        
        public struct Checkbox {
            var width: Double
            var height: Double
        }
        var checkbox  = Checkbox(width:0.0, height: 0.0)
        
        public struct Info {
            var width: Double
            var height: Double
        }
        var info  = Info(width:0.0, height: 0.0)
        
        public struct Items {
            var width: Double
            var height: Double
        }
        var items  = Items(width:0.0, height: 0.0)
        
        public struct Articles {
            var width: Double
            var height: Double
        }
        var articles  = Articles(width:0.0, height: 0.0)
        
        public struct More {
            var width: Double
            var height: Double
        }
        var more  = More(width:0.0, height: 0.0)
        
    }
    
    public struct DeadView {
        var width: Double
        var height: Double
        
        public struct Padding {
            var width: Double
            var height: Double
        }
        var padding  = Padding(width:0.0, height: 0.0)
        
        
        public struct FinalImage {
            var width: Double
            var height: Double
        }
        var finalImage  = FinalImage(width:0.0, height: 0.0)
        
        public struct FinalText {
            var width: Double
            var height: Double
        }
        var finalText  = FinalText(width:0.0, height: 0.0)
        
        public struct FinalButton {
            var width: Double
            var height: Double
        }
        var finalButton  = FinalButton(width:0.0, height: 0.0)
    }
    
    
    public var newView = NewView()
    public var gridView = GridView()
    public var spinnerView = SpinnerView()
    public var goalView = GoalView(width: 0.0, height: 0.0)
    public var navigateView = NavigateView(width: 0.0, height: 0.0)
    public var fightView = FightView(width: 0.0, height: 0.0)
    public var spinForLootView = SpinForLootView(width: 0.0, height: 0.0)
    public var backpackView = BackpackView(width: 0.0, height: 0.0)
    public var deadView = DeadView(width: 0.0, height: 0.0)
    
}
