

//
//  ViewManager.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 12/2/21.
//

import Foundation
import SwiftUI

public class ViewManager:ObservableObject {
    
    @Published var viewModel = ViewModel()
    
    var viewDefaults = ViewDefaults()
    
    deinit {
        print("ViewManager is deinitialized")
    }
    
    
    
    
    public var newView:  ViewModel.NewView {
        
        var headerHeight:  Double {
            set {viewModel.newView.headerHeight = newValue}
            get {return viewModel.newView.headerHeight}
        }
        
        var adventureHeaderHeight:  Double {
            set {viewModel.newView.adventureHeaderHeight = newValue}
            get {return viewModel.newView.adventureHeaderHeight}
        }
        
        var creatingHeaderHeight:  Double {
            set {viewModel.newView.creatingHeaderHeight = newValue}
            get {return viewModel.newView.creatingHeaderHeight}
        }
        
        var scrollAreaHeight:  Double {
            set {viewModel.newView.scrollAreaHeight = newValue}
            get {return viewModel.newView.scrollAreaHeight}
        }
        
        var scrollAreaWidth:  Double {
            set {viewModel.newView.scrollAreaWidth = newValue}
            get {return viewModel.newView.scrollAreaWidth}
        }
        
        var image: ViewModel.NewView.Image {
            var width: Double {
                set {viewModel.newView.image.width = newValue}
                get {return viewModel.newView.image.width}
            }
            var height: Double {
                set {viewModel.newView.image.height = newValue}
                get {return viewModel.newView.image.height}
            }
            return viewModel.newView.image
        }
        
        var title: ViewModel.NewView.Title {
            var width: Double {
                set {viewModel.newView.title.width = newValue}
                get {return viewModel.newView.title.width}
            }
            var height: Double {
                set {viewModel.newView.title.height = newValue}
                get {return viewModel.newView.title.height}
            }
            return viewModel.newView.title
        }
        
        var delete: ViewModel.NewView.Delete {
            var width: Double {
                set {viewModel.newView.delete.width = newValue}
                get {return viewModel.newView.delete.width}
            }
            var height: Double {
                set {viewModel.newView.delete.height = newValue}
                get {return viewModel.newView.delete.height}
            }
            return viewModel.newView.delete
        }
        
        return viewModel.newView
    }
    
    
    
    public var gridView:  ViewModel.GridView {
        var grid: ViewModel.GridView.Grid {
            var cellDim: Double {
                set {viewModel.gridView.grid.cellDim = newValue}
                get {return viewModel.gridView.grid.cellDim}
            }
            var frameDim: Double {
                set {viewModel.gridView.grid.frameDim = newValue}
                get {return viewModel.gridView.grid.frameDim}
            }
            var gridSize: Double {
                set {viewModel.gridView.grid.gridSize = newValue}
                get {return viewModel.gridView.grid.gridSize}
            }
            
            return viewModel.gridView.grid
           
        }
        return viewModel.gridView
    }
    
    var spinnerView:  ViewModel.SpinnerView{
        var width: Double {
            set {viewModel.spinnerView.width = newValue}
            get {return viewModel.spinnerView.width}
        }
        var height: Double {
            set {viewModel.spinnerView.height = newValue}
            get {return viewModel.spinnerView.height}
        }
        
        var stats: ViewModel.SpinnerView.Stats {
            var width: Double {
                set {viewModel.spinnerView.stats.width = newValue}
                get {return viewModel.spinnerView.stats.width}
            }
            var height: Double {
                set {viewModel.spinnerView.stats.height = newValue}
                get {return viewModel.spinnerView.stats.height}
            }
            var columnPadding: Double {
                set {viewModel.spinnerView.stats.columnPadding = newValue}
                get {return viewModel.spinnerView.stats.columnPadding}
            }
            var rowPadding: Double {
                set {viewModel.spinnerView.stats.rowPadding = newValue}
                get {return viewModel.spinnerView.stats.rowPadding}
            }
            var levelNameWidth: Double {
                set {viewModel.spinnerView.stats.levelNameWidth = newValue}
                get {return viewModel.spinnerView.stats.levelNameWidth}
            }
            var levelNameHeight: Double {
                set {viewModel.spinnerView.stats.levelNameHeight = newValue}
                get {return viewModel.spinnerView.stats.levelNameHeight}
            }
            var pointsWidth: Double {
                set {viewModel.spinnerView.stats.pointsWidth = newValue}
                get {return viewModel.spinnerView.stats.pointsWidth}
            }
            var pointsHeight: Double {
                set {viewModel.spinnerView.stats.pointsHeight = newValue}
                get {return viewModel.spinnerView.stats.pointsHeight}
            }
            var toolTypeWidth: Double {
                set {viewModel.spinnerView.stats.toolTypeWidth = newValue}
                get {return viewModel.spinnerView.stats.toolTypeWidth}
            }
            var toolTypeHeight: Double {
                set {viewModel.spinnerView.stats.toolTypeHeight = newValue}
                get {return viewModel.spinnerView.stats.toolTypeHeight}
            }
            var toolNameWidth: Double {
                set {viewModel.spinnerView.stats.toolNameWidth = newValue}
                get {return viewModel.spinnerView.stats.toolNameWidth}
            }
            var toolNameHeight: Double {
                set {viewModel.spinnerView.stats.toolNameHeight = newValue}
                get {return viewModel.spinnerView.stats.toolNameHeight}
            }
            var toolImageWidth: Double {
                set {viewModel.spinnerView.stats.toolImageWidth = newValue}
                get {return viewModel.spinnerView.stats.toolImageWidth}
            }
            var toolImageHeight: Double {
                set {viewModel.spinnerView.stats.toolImageHeight = newValue}
                get {return viewModel.spinnerView.stats.toolImageHeight}
            }
            return viewModel.spinnerView.stats
        }
        
        var spinner: ViewModel.SpinnerView.Spinner {
            var width: Double {
                set {viewModel.spinnerView.spinner.width = newValue}
                get {return viewModel.spinnerView.spinner.width}
            }
            var height: Double {
                set {viewModel.spinnerView.spinner.height = newValue}
                get {return viewModel.spinnerView.spinner.height}
            }
            return viewModel.spinnerView.spinner
        }
        
            
        var tab: ViewModel.SpinnerView.Tab {
            var width: Double {
                set {viewModel.spinnerView.tab.width = newValue}
                get {return viewModel.spinnerView.tab.width}
            }
            var height: Double {
                set {viewModel.spinnerView.tab.height = newValue}
                get {return viewModel.spinnerView.tab.height}
            }
            var x: Double {
                set {viewModel.spinnerView.tab.x = newValue}
                get {return viewModel.spinnerView.tab.x}
            }
            var y: Double {
                set {viewModel.spinnerView.tab.y = newValue}
                get {return viewModel.spinnerView.tab.y}
            }
            var widthPerTab: Double {
                set {viewModel.spinnerView.tab.widthPerTab = newValue}
                get {return viewModel.spinnerView.tab.widthPerTab}
            }
            var heightPerTab: Double {
                set {viewModel.spinnerView.tab.heightPerTab = newValue}
                get {return viewModel.spinnerView.tab.heightPerTab}
            }
            return viewModel.spinnerView.tab
        }
        
        return viewModel.spinnerView
    }

    var navigateView:  ViewModel.NavigateView{
       
        var width:  Double {
            set {viewModel.navigateView.width = newValue}
            get {return viewModel.navigateView.width}
        }
        var height:  Double {
            set {viewModel.navigateView.height = newValue}
            get {return viewModel.navigateView.height}
        }
        
        var leftArrow: ViewModel.NavigateView.LeftArrow {
            var width: Double {
                set {viewModel.navigateView.leftArrow.width = newValue}
                get {return viewModel.navigateView.leftArrow.width}
            }
            var height: Double {
                set {viewModel.navigateView.leftArrow.height = newValue}
                get {return viewModel.navigateView.leftArrow.height}
            }
            return viewModel.navigateView.leftArrow
        }
        
        var iconPadding: ViewModel.NavigateView.IconPadding {
            var width: Double {
                set {viewModel.navigateView.iconPadding.width = newValue}
                get {return viewModel.navigateView.iconPadding.width}
            }
            var height: Double {
                set {viewModel.navigateView.iconPadding.height = newValue}
                get {return viewModel.navigateView.iconPadding.height}
            }
            return viewModel.navigateView.iconPadding
        }
        
        var backpack: ViewModel.NavigateView.BackPack {
            var width: Double {
                set {viewModel.navigateView.backpack.width = newValue}
                get {return viewModel.navigateView.backpack.width}
            }
            var height: Double {
                set {viewModel.navigateView.backpack.height = newValue}
                get {return viewModel.navigateView.backpack.height}
            }
            return viewModel.navigateView.backpack
        }
        
        var book: ViewModel.NavigateView.Book {
            var width: Double {
                set {viewModel.navigateView.book.width = newValue}
                get {return viewModel.navigateView.book.width}
            }
            var height: Double {
                set {viewModel.navigateView.book.height = newValue}
                get {return viewModel.navigateView.book.height}
            }
            return viewModel.navigateView.book
        }
        
        var stats: ViewModel.NavigateView.Stats {
            var width: Double {
                set {viewModel.navigateView.stats.width = newValue}
                get {return viewModel.navigateView.stats.width}
            }
            var height: Double {
                set {viewModel.navigateView.stats.height = newValue}
                get {return viewModel.navigateView.stats.height}
            }
            return viewModel.navigateView.stats
        }
        
        var help: ViewModel.NavigateView.Help {
            var width: Double {
                set {viewModel.navigateView.help.width = newValue}
                get {return viewModel.navigateView.help.width}
            }
            var height: Double {
                set {viewModel.navigateView.help.height = newValue}
                get {return viewModel.navigateView.help.height}
            }
            return viewModel.navigateView.help
        }
        
        var beforeStatsPadding: ViewModel.NavigateView.BeforeStatsPadding {
            var width: Double {
                set {viewModel.navigateView.beforeStatsPadding.width = newValue}
                get {return viewModel.navigateView.beforeStatsPadding.width}
            }
            var height: Double {
                set {viewModel.navigateView.beforeStatsPadding.height = newValue}
                get {return viewModel.navigateView.beforeStatsPadding.height}
            }
            return viewModel.navigateView.beforeStatsPadding
        }
        
        var afterStatsPadding: ViewModel.NavigateView.AfterStatsPadding {
            var width: Double {
                set {viewModel.navigateView.afterStatsPadding.width = newValue}
                get {return viewModel.navigateView.afterStatsPadding.width}
            }
            var height: Double {
                set {viewModel.navigateView.afterStatsPadding.height = newValue}
                get {return viewModel.navigateView.afterStatsPadding.height}
            }
            return viewModel.navigateView.afterStatsPadding
        }
        
        var statsIcon: ViewModel.NavigateView.StatsIcon {
            var width: Double {
                set {viewModel.navigateView.statsIcon.width = newValue}
                get {return viewModel.navigateView.statsIcon.width}
            }
            var height: Double {
                set {viewModel.navigateView.statsIcon.height = newValue}
                get {return viewModel.navigateView.statsIcon.height}
            }
            return viewModel.navigateView.statsIcon
        }
        
        var share: ViewModel.NavigateView.Share {
            var width: Double {
                set {viewModel.navigateView.share.width = newValue}
                get {return viewModel.navigateView.share.width}
            }
            var height: Double {
                set {viewModel.navigateView.share.height = newValue}
                get {return viewModel.navigateView.share.height}
            }
            return viewModel.navigateView.share
        }
        
        var gear: ViewModel.NavigateView.Gear {
            var width: Double {
                set {viewModel.navigateView.gear.width = newValue}
                get {return viewModel.navigateView.gear.width}
            }
            var height: Double {
                set {viewModel.navigateView.gear.height = newValue}
                get {return viewModel.navigateView.gear.height}
            }
            return viewModel.navigateView.gear
        }
        
        var home: ViewModel.NavigateView.Home {
            var width: Double {
                set {viewModel.navigateView.home.width = newValue}
                get {return viewModel.navigateView.home.width}
            }
            var height: Double {
                set {viewModel.navigateView.home.height = newValue}
                get {return viewModel.navigateView.home.height}
            }
            return viewModel.navigateView.home
        }
        
        
        var rightArrow: ViewModel.NavigateView.RightArrow {
            var width: Double {
                set {viewModel.navigateView.rightArrow.width = newValue}
                get {return viewModel.navigateView.rightArrow.width}
            }
            var height: Double {
                set {viewModel.navigateView.rightArrow.height = newValue}
                get {return viewModel.navigateView.rightArrow.height}
            }
            return viewModel.navigateView.rightArrow
        }
           
        return viewModel.navigateView
    }
    
    
    var fightView:  ViewModel.FightView{
       
        var width:  Double {
            set {viewModel.fightView.width = newValue}
            get {return viewModel.fightView.width}
        }
        var height:  Double {
            set {viewModel.fightView.height = newValue}
            get {return viewModel.fightView.height}
        }
        
        var name: ViewModel.FightView.Name {
            var width: Double {
                set {viewModel.fightView.name.width = newValue}
                get {return viewModel.fightView.name.width}
            }
            var height: Double {
                set {viewModel.fightView.name.height = newValue}
                get {return viewModel.fightView.name.height}
            }
            return viewModel.fightView.name
        }
        
        var padding: ViewModel.FightView.Padding {
            var width: Double {
                set {viewModel.fightView.padding.width = newValue}
                get {return viewModel.fightView.padding.width}
            }
            var height: Double {
                set {viewModel.fightView.padding.height = newValue}
                get {return viewModel.fightView.padding.height}
            }
            return viewModel.fightView.padding
        }
        
        var majorFight: ViewModel.FightView.MajorFight {
            var width: Double {
                set {viewModel.fightView.majorFight.width = newValue}
                get {return viewModel.fightView.majorFight.width}
            }
            var height: Double {
                set {viewModel.fightView.majorFight.height = newValue}
                get {return viewModel.fightView.majorFight.height}
            }
            return viewModel.fightView.majorFight
        }
        
        var majorFightData: ViewModel.FightView.MajorFightData {
            var width: Double {
                set {viewModel.fightView.majorFightData.width = newValue}
                get {return viewModel.fightView.majorFightData.width}
            }
            var height: Double {
                set {viewModel.fightView.majorFightData.height = newValue}
                get {return viewModel.fightView.majorFightData.height}
            }
            return viewModel.fightView.majorFightData
        }
        
        var majorFightAndTitle: ViewModel.FightView.MajorFightAndTitle {
            var width: Double {
                set {viewModel.fightView.majorFightAndTitle.width = newValue}
                get {return viewModel.fightView.majorFightAndTitle.width}
            }
            var height: Double {
                set {viewModel.fightView.majorFightAndTitle.height = newValue}
                get {return viewModel.fightView.majorFightAndTitle.height}
            }
            return viewModel.fightView.majorFightAndTitle
        }
        
        var majorFightPadding: ViewModel.FightView.MajorFightPadding {
            var width: Double {
                set {viewModel.fightView.majorFightPadding.width = newValue}
                get {return viewModel.fightView.majorFightPadding.width}
            }
            var height: Double {
                set {viewModel.fightView.majorFightPadding.height = newValue}
                get {return viewModel.fightView.majorFightPadding.height}
            }
            return viewModel.fightView.majorFightPadding
        }
        
        var majorFightImage: ViewModel.FightView.MajorFightImage {
            var width: Double {
                set {viewModel.fightView.majorFightImage.width = newValue}
                get {return viewModel.fightView.majorFightImage.width}
            }
            var height: Double {
                set {viewModel.fightView.majorFightImage.height = newValue}
                get {return viewModel.fightView.majorFightImage.height}
            }
            return viewModel.fightView.majorFightImage
        }
        
        var majorFightInfo: ViewModel.FightView.MajorFightInfo {
            var width: Double {
                set {viewModel.fightView.majorFightInfo.width = newValue}
                get {return viewModel.fightView.majorFightInfo.width}
            }
            var height: Double {
                set {viewModel.fightView.majorFightInfo.height = newValue}
                get {return viewModel.fightView.majorFightInfo.height}
            }
            return viewModel.fightView.majorFightInfo
        }
        
        var majorFightLife: ViewModel.FightView.MajorFightLife {
            var width: Double {
                set {viewModel.fightView.majorFightLife.width = newValue}
                get {return viewModel.fightView.majorFightLife.width}
            }
            var height: Double {
                set {viewModel.fightView.majorFightLife.height = newValue}
                get {return viewModel.fightView.majorFightLife.height}
            }
            return viewModel.fightView.majorFightLife
        }
        
        var minorFight: ViewModel.FightView.MinorFight {
            var width: Double {
                set {viewModel.fightView.minorFight.width = newValue}
                get {return viewModel.fightView.minorFight.width}
            }
            var height: Double {
                set {viewModel.fightView.minorFight.height = newValue}
                get {return viewModel.fightView.minorFight.height}
            }
            return viewModel.fightView.minorFight
        }
        
        var minorFightHeading: ViewModel.FightView.MinorFightHeading {
            var width: Double {
                set {viewModel.fightView.minorFightHeading.width = newValue}
                get {return viewModel.fightView.minorFightHeading.width}
            }
            var height: Double {
                set {viewModel.fightView.minorFightHeading.height = newValue}
                get {return viewModel.fightView.minorFightHeading.height}
            }
            return viewModel.fightView.minorFightHeading
        }
        
        var minorFightImage: ViewModel.FightView.MinorFightImage {
            var width: Double {
                set {viewModel.fightView.minorFightImage.width = newValue}
                get {return viewModel.fightView.minorFightImage.width}
            }
            var height: Double {
                set {viewModel.fightView.minorFightImage.height = newValue}
                get {return viewModel.fightView.minorFightImage.height}
            }
            return viewModel.fightView.minorFightImage
        }
        
        var minorFightName: ViewModel.FightView.MinorFightName {
            var width: Double {
                set {viewModel.fightView.minorFightName.width = newValue}
                get {return viewModel.fightView.minorFightName.width}
            }
            var height: Double {
                set {viewModel.fightView.minorFightName.height = newValue}
                get {return viewModel.fightView.minorFightName.height}
            }
            return viewModel.fightView.minorFightName
        }
        
        var minorFightLife: ViewModel.FightView.MinorFightLife {
            var width: Double {
                set {viewModel.fightView.minorFightLife.width = newValue}
                get {return viewModel.fightView.minorFightLife.width}
            }
            var height: Double {
                set {viewModel.fightView.majorFightLife.height = newValue}
                get {return viewModel.fightView.majorFightLife.height}
            }
            return viewModel.fightView.minorFightLife
        }
        
        return viewModel.fightView
    }

    
    var goalView:  ViewModel.GoalView {
        var width:  Double {
            set {viewModel.goalView.width = newValue}
            get {return viewModel.goalView.width}
        }
        var height:  Double {
            set {viewModel.goalView.height = newValue}
            get {return viewModel.goalView.height}
        }
        
        var title: ViewModel.GoalView.Title {
            var width: Double {
                set {viewModel.goalView.title.width = newValue}
                get {return viewModel.goalView.title.width}
            }
            var height: Double {
                set {viewModel.goalView.title.height = newValue}
                get {return viewModel.goalView.title.height}
            }
            return viewModel.goalView.title
        }
        
        var titlePadding: ViewModel.GoalView.TitlePadding {
            var width: Double {
                set {viewModel.goalView.titlePadding.width = newValue}
                get {return viewModel.goalView.titlePadding.width}
            }
            var height: Double {
                set {viewModel.goalView.titlePadding.height = newValue}
                get {return viewModel.goalView.titlePadding.height}
            }
            return viewModel.goalView.titlePadding
        }
        
        var checkbox: ViewModel.GoalView.Checkbox {
            var width: Double {
                set {viewModel.goalView.checkbox.width = newValue}
                get {return viewModel.goalView.checkbox.width}
            }
            var height: Double {
                set {viewModel.goalView.checkbox.height = newValue}
                get {return viewModel.goalView.checkbox.height}
            }
            return viewModel.goalView.checkbox
        }
        
        var column: ViewModel.GoalView.Column {
            var width: Double {
                set {viewModel.goalView.column.width = newValue}
                get {return viewModel.goalView.column.width}
            }
            var height: Double {
                set {viewModel.goalView.column.height = newValue}
                get {return viewModel.goalView.column.height}
            }
            return viewModel.goalView.column
        }
        
        var columnPadding: ViewModel.GoalView.ColumnPadding {
            var width: Double {
                set {viewModel.goalView.columnPadding.width = newValue}
                get {return viewModel.goalView.columnPadding.width}
            }
            var height: Double {
                set {viewModel.goalView.columnPadding.height = newValue}
                get {return viewModel.goalView.columnPadding.height}
            }
            return viewModel.goalView.columnPadding
        }
        
        return viewModel.goalView
    }
    
    var backpackView:  ViewModel.BackpackView{
        
        var width:  Double {
            set {viewModel.backpackView.width = newValue}
            get {return viewModel.backpackView.width}
        }
        var height:  Double {
            set {viewModel.backpackView.height = newValue}
            get {return viewModel.backpackView.height}
        }
        
        var title: ViewModel.BackpackView.Title {
            var width: Double {
                set {viewModel.backpackView.title.width = newValue}
                get {return viewModel.backpackView.title.width}
            }
            var height: Double {
                set {viewModel.backpackView.title.height = newValue}
                get {return viewModel.backpackView.title.height}
            }
            return viewModel.backpackView.title
        }
        
        var name: ViewModel.BackpackView.Name {
            var width: Double {
                set {viewModel.backpackView.name.width = newValue}
                get {return viewModel.backpackView.name.width}
            }
            var height: Double {
                set {viewModel.backpackView.name.height = newValue}
                get {return viewModel.backpackView.name.height}
            }
            return viewModel.backpackView.name
        }
        
        var checkbox: ViewModel.BackpackView.Checkbox {
            var width: Double {
                set {viewModel.backpackView.checkbox.width = newValue}
                get {return viewModel.backpackView.checkbox.width}
            }
            var height: Double {
                set {viewModel.backpackView.checkbox.height = newValue}
                get {return viewModel.backpackView.checkbox.height}
            }
            return viewModel.backpackView.checkbox
        }
        
        var info: ViewModel.BackpackView.Info {
            var width: Double {
                set {viewModel.backpackView.info.width = newValue}
                get {return viewModel.backpackView.info.width}
            }
            var height: Double {
                set {viewModel.backpackView.info.height = newValue}
                get {return viewModel.backpackView.info.height}
            }
            return viewModel.backpackView.info
        }
        
        var padding: ViewModel.BackpackView.Padding {
            var width: Double {
                set {viewModel.backpackView.padding.width = newValue}
                get {return viewModel.backpackView.padding.width}
            }
            var height: Double {
                set {viewModel.backpackView.padding.height = newValue}
                get {return viewModel.backpackView.padding.height}
            }
            return viewModel.backpackView.padding
        }
        
        var items: ViewModel.BackpackView.Items {
            var width: Double {
                set {viewModel.backpackView.items.width = newValue}
                get {return viewModel.backpackView.items.width}
            }
            var height: Double {
                set {viewModel.backpackView.items.height = newValue}
                get {return viewModel.backpackView.items.height}
            }
            return viewModel.backpackView.items
        }
        
        var articles: ViewModel.BackpackView.Articles {
            var width: Double {
                set {viewModel.backpackView.articles.width = newValue}
                get {return viewModel.backpackView.articles.width}
            }
            var height: Double {
                set {viewModel.backpackView.articles.height = newValue}
                get {return viewModel.backpackView.articles.height}
            }
            return viewModel.backpackView.articles
        }
        
        var more: ViewModel.BackpackView.More {
            var width: Double {
                set {viewModel.backpackView.more.width = newValue}
                get {return viewModel.backpackView.more.width}
            }
            var height: Double {
                set {viewModel.backpackView.more.height = newValue}
                get {return viewModel.backpackView.more.height}
            }
            return viewModel.backpackView.more
        }
        
        return viewModel.backpackView
    }
        
        
        var deadView:  ViewModel.DeadView{
            
            var width:  Double {
                set {viewModel.deadView.width = newValue}
                get {return viewModel.deadView.width}
            }
            var height:  Double {
                set {viewModel.deadView.height = newValue}
                get {return viewModel.deadView.height}
            }
            
            var padding: ViewModel.DeadView.Padding{
                var width: Double {
                    set {viewModel.deadView.padding.width = newValue}
                    get {return viewModel.deadView.padding.width}
                }
                var height: Double {
                    set {viewModel.deadView.padding.height = newValue}
                    get {return viewModel.deadView.padding.height}
                }
                return viewModel.deadView.padding
            }
            
            var finalImage: ViewModel.DeadView.FinalImage {
                var width: Double {
                    set {viewModel.deadView.finalImage.width = newValue}
                    get {return viewModel.deadView.finalImage.width}
                }
                var height: Double {
                    set {viewModel.deadView.finalImage.height = newValue}
                    get {return viewModel.deadView.finalImage.height}
                }
                return viewModel.deadView.finalImage
            }
            
            var finalText: ViewModel.DeadView.FinalText {
                var width: Double {
                    set {viewModel.deadView.finalText.width = newValue}
                    get {return viewModel.deadView.finalText.width}
                }
                var height: Double {
                    set {viewModel.deadView.finalText.height = newValue}
                    get {return viewModel.deadView.finalText.height}
                }
                return viewModel.deadView.finalText
            }
            
            var finalButton: ViewModel.DeadView.FinalButton {
                var width: Double {
                    set {viewModel.deadView.finalButton.width = newValue}
                    get {return viewModel.deadView.finalButton.width}
                }
                var height: Double {
                    set {viewModel.deadView.finalButton.height = newValue}
                    get {return viewModel.deadView.finalButton.height}
                }
                return viewModel.deadView.finalButton
            }
            return viewModel.deadView
        }
       
    


    
    public func update(width: Double,
                height: Double) {
        
        var newWidth = width
        let newHeight = height
        if width > height {
            newWidth = height
        }
        
        let frameDim = CGFloat(smallestGridDim(width: newWidth, height: newHeight * viewDefaults.percentGridView))
      
        viewModel.newView.headerHeight = newHeight * viewDefaults.percentNewHeader
        viewModel.newView.adventureHeaderHeight = newHeight * viewDefaults.percentAdventureHeader
        viewModel.newView.creatingHeaderHeight = newHeight * viewDefaults.percentCreatingHeader
        viewModel.newView.scrollAreaHeight = newHeight * viewDefaults.percentScrollAreaHeight
        
        viewModel.newView.image.width = newWidth * viewDefaults.percentImageWidth
        viewModel.newView.image.height = newHeight * viewDefaults.percentImageHeight
        
        viewModel.newView.title.width = newWidth * viewDefaults.percentTitleWidth
        viewModel.newView.title.height = newHeight * viewDefaults.percentTitleHeight
        
        viewModel.newView.delete.width = newWidth * viewDefaults.percentDeleteWidth
        viewModel.newView.delete.height = newHeight * viewDefaults.percentDeleteHeight
        
        viewModel.newView.scrollAreaWidth = newWidth * viewDefaults.percentScrollAreaWidth
        viewModel.newView.bottomPadding = newWidth * viewDefaults.percentLoadingPadding
        
        viewModel.spinnerView.width = newWidth
        viewModel.spinnerView.height = newHeight * viewDefaults.percentSpinnerView
        
        viewModel.spinnerView.padding = newWidth * viewDefaults.percentSpinnerPadding
        
        viewModel.spinnerView.stats.width  = newWidth * viewDefaults.percentStat
        viewModel.spinnerView.stats.height = viewModel.spinnerView.height * 0.90
        viewModel.spinnerView.stats.columnPadding = viewModel.spinnerView.stats.width * viewDefaults.percentStatPadding
        viewModel.spinnerView.stats.rowPadding = viewModel.spinnerView.stats.height * viewDefaults.percentStatPadding
        
        viewModel.spinnerView.stats.levelNameWidth  = viewModel.spinnerView.stats.width * viewDefaults.percentStatToolSectionWidth
        viewModel.spinnerView.stats.levelNameHeight  = viewModel.spinnerView.stats.width * viewDefaults.percentStatLevelNameHeight
        
        viewModel.spinnerView.stats.pointsWidth  = viewModel.spinnerView.stats.width * viewDefaults.percentStatInfoSectionWidth/2
        viewModel.spinnerView.stats.pointsHeight  = viewModel.spinnerView.stats.levelNameHeight
       
        viewModel.spinnerView.stats.toolTypeHeight  = viewModel.spinnerView.stats.width * viewDefaults.percentStatToolTypeHeight
        viewModel.spinnerView.stats.toolTypeWidth  =
            viewModel.spinnerView.stats.levelNameWidth
        
        viewModel.spinnerView.stats.toolNameHeight  = viewModel.spinnerView.stats.width * viewDefaults.percentStatToolNameHeight
        viewModel.spinnerView.stats.toolNameWidth  =
            viewModel.spinnerView.stats.levelNameWidth
        
        viewModel.spinnerView.stats.toolImageHeight  = viewModel.spinnerView.stats.width * viewDefaults.percentStatLevelNameHeight
        viewModel.spinnerView.stats.toolNameWidth  =
            viewModel.spinnerView.stats.pointsWidth
       
        
        
        
        viewModel.spinnerView.spinner.width  = newWidth * viewDefaults.percentSpinner
        viewModel.spinnerView.spinner.height = newHeight * viewDefaults.percentSpinnerView
        
        //viewModel.spinnerView.tab.width  = viewModel.spinnerView.spinner.width / 2
        viewModel.spinnerView.tab.width  = viewModel.spinnerView.width * viewDefaults.percentTab
        viewModel.spinnerView.tab.height = newHeight * viewDefaults.percentSpinnerView
        viewModel.spinnerView.tab.widthPerTab = viewModel.spinnerView.tab.width
        
        
        
        viewModel.goalView.width  = newWidth
        viewModel.navigateView.height = newHeight * viewDefaults.percentNavigatingView
        
        viewModel.navigateView.iconPadding.width = viewModel.goalView.width * viewDefaults.percentNavigatingViewIconPadding
        viewModel.navigateView.iconPadding.height =  viewModel.navigateView.height * viewDefaults.percentNavigatingViewIconHeight
        
        viewModel.navigateView.leftArrow.width = viewModel.goalView.width * viewDefaults.percentNavigatingViewLeftArrow
        viewModel.navigateView.leftArrow.height =  viewModel.navigateView.height * viewDefaults.percentNavigatingViewIconHeight
        
        viewModel.navigateView.backpack.width = viewModel.goalView.width * viewDefaults.percentNavigatingViewBackPack
        viewModel.navigateView.backpack.height =  viewModel.navigateView.height * viewDefaults.percentNavigatingViewIconHeight
        
        viewModel.navigateView.book.width = viewModel.goalView.width * viewDefaults.percentNavigatingViewBook
        viewModel.navigateView.book.height =  viewModel.navigateView.height * viewDefaults.percentNavigatingViewIconHeight
        
        viewModel.navigateView.help.width = viewModel.goalView.width * viewDefaults.percentNavigatingViewHelp
        viewModel.navigateView.help.height =  viewModel.navigateView.height * viewDefaults.percentNavigatingViewIconHeight
        
        viewModel.navigateView.stats.width = viewModel.goalView.width * viewDefaults.percentNavigatingViewStats
        viewModel.navigateView.stats.height =  viewModel.navigateView.height * viewDefaults.percentNavigatingViewIconHeight
        
        viewModel.navigateView.share.width = viewModel.goalView.width * viewDefaults.percentNavigatingViewShare
        viewModel.navigateView.share.height =  viewModel.navigateView.height * viewDefaults.percentNavigatingViewIconHeight
        
        viewModel.navigateView.gear.width = viewModel.goalView.width * viewDefaults.percentNavigatingViewGear
        viewModel.navigateView.gear.height =  viewModel.navigateView.height * viewDefaults.percentNavigatingViewIconHeight
        
        viewModel.navigateView.home.width = viewModel.goalView.width * viewDefaults.percentNavigatingViewHome
        viewModel.navigateView.home.height =  viewModel.navigateView.height * viewDefaults.percentNavigatingViewIconHeight
        
        viewModel.navigateView.beforeStatsPadding.width = viewModel.goalView.width * viewDefaults.percentNavigatingViewBeforeStatsPadding
        viewModel.navigateView.beforeStatsPadding.height =  viewModel.navigateView.height * viewDefaults.percentNavigatingViewIconHeight
        
        viewModel.navigateView.afterStatsPadding.width = viewModel.goalView.width * viewDefaults.percentNavigatingViewAfterStatsPadding
        viewModel.navigateView.afterStatsPadding.height =  viewModel.navigateView.height * viewDefaults.percentNavigatingViewIconHeight
        
        viewModel.navigateView.rightArrow.width = viewModel.goalView.width * viewDefaults.percentNavigatingViewRightArrow
        viewModel.navigateView.rightArrow.height =  viewModel.navigateView.height * viewDefaults.percentNavigatingViewIconHeight
        
        
        
 
        
        
        viewModel.gridView.grid.cellDim = CGFloat(Double(frameDim)/Double(viewDefaults.numOfColumns + 2))
        viewModel.gridView.grid.frameDim  = frameDim - (viewModel.gridView.grid.cellDim * 2)
        
        viewModel.goalView.width  = viewModel.gridView.grid.frameDim
        viewModel.goalView.height = newHeight * viewDefaults.percentGoalView
        
        viewModel.goalView.title.width = viewModel.goalView.width * viewDefaults.percentGoalViewTitle
        viewModel.goalView.title.height =  viewModel.goalView.height * viewDefaults.percentGoalViewHeightPadding
        
        viewModel.goalView.titlePadding.width = viewModel.goalView.width * viewDefaults.percentGoalViewTitlePadding
        viewModel.goalView.titlePadding.height =  viewModel.goalView.height * viewDefaults.percentGoalViewHeightPadding
        
        viewModel.goalView.checkbox.width = viewModel.goalView.width * viewDefaults.percentGoalViewCheckbox
        viewModel.goalView.checkbox.height =  viewModel.goalView.height * viewDefaults.percentGoalViewHeightPadding
        
        viewModel.goalView.column.width = viewModel.goalView.width * viewDefaults.percentGoalViewColumn
        viewModel.goalView.column.height =  viewModel.goalView.height * viewDefaults.percentGoalViewHeightPadding
        
        viewModel.goalView.columnPadding.width = viewModel.goalView.width * viewDefaults.percentGoalViewColumnPadding
        viewModel.goalView.columnPadding.height =  viewModel.goalView.height * viewDefaults.percentGoalViewHeightPadding
        
        
        
        
        
        viewModel.fightView.width = viewModel.gridView.grid.frameDim
        viewModel.fightView.height = viewModel.gridView.grid.frameDim
        
        viewModel.fightView.name.width = viewModel.fightView.width
        viewModel.fightView.name.height =  viewModel.fightView.height * viewDefaults.percentFightViewName
        
        viewModel.fightView.padding.width = viewModel.fightView.width * viewDefaults.percentFightView
        viewModel.fightView.padding.height =  viewModel.fightView.height * viewDefaults.percentFightViewPadding
        
        viewModel.fightView.majorFight.width = viewModel.fightView.width * viewDefaults.percentFightView
        viewModel.fightView.majorFight.height =  viewModel.fightView.height * viewDefaults.percentFightViewMajorFight
        
        viewModel.fightView.majorFightImage.width = viewModel.fightView.majorFight.width * viewDefaults.percentFightViewMajorFightImage
        viewModel.fightView.majorFightImage.height = viewModel.fightView.majorFight.height
        
        viewModel.fightView.majorFightData.width = viewModel.fightView.majorFight.width * viewDefaults.percentFightViewMajorFightData
        viewModel.fightView.majorFightData.height = viewModel.fightView.majorFight.height
        
        viewModel.fightView.majorFightAndTitle.width = viewModel.fightView.majorFight.width
        viewModel.fightView.majorFightAndTitle.height = viewModel.fightView.majorFight.height + viewModel.fightView.name.height + viewModel.fightView.padding.height * 2
        
        
        viewModel.fightView.majorFightPadding.width =  viewModel.fightView.majorFightData.width
        viewModel.fightView.majorFightPadding.height =  viewModel.fightView.majorFightData.height *  viewDefaults.percentFightViewMajorFightPadding
        
        viewModel.fightView.majorFightLife.width =  viewModel.fightView.majorFightData.width
        viewModel.fightView.majorFightLife.height =  viewModel.fightView.majorFightData.height *  viewDefaults.percentFightViewMajorFightLife
        
        viewModel.fightView.majorFightInfo.width = viewModel.fightView.majorFightData.width
        viewModel.fightView.majorFightInfo.height = viewModel.fightView.majorFightData.height *  viewDefaults.percentFightViewMajorFightInfo
        
        viewModel.fightView.minorFight.width = viewModel.fightView.width * viewDefaults.percentFightView
        viewModel.fightView.minorFight.height =  viewModel.fightView.height * viewDefaults.percentFightViewMinorFight
        
        viewModel.fightView.minorFightHeading.width = viewModel.fightView.width
        viewModel.fightView.minorFightHeading.height =  viewModel.fightView.height * viewDefaults.percentFightViewMinorHeading
        
        viewModel.fightView.minorFightImage.width = viewModel.fightView.width
        viewModel.fightView.minorFightImage.height =  viewModel.fightView.minorFight.height * viewDefaults.percentFightViewMinorFight
        
        viewModel.fightView.minorFightName.width = viewModel.fightView.width
        viewModel.fightView.minorFightName.height =  viewModel.fightView.minorFight.height * viewDefaults.percentFightViewMinorFightName
        
        
        
        
        
        viewModel.backpackView.width = viewModel.gridView.grid.frameDim
        viewModel.backpackView.height = viewModel.gridView.grid.frameDim
       
        viewModel.backpackView.title.width = viewModel.backpackView.width
        viewModel.backpackView.title.height = viewModel.backpackView.height * viewDefaults.percentBackpackViewTitle
       

        viewModel.backpackView.padding.width = viewModel.backpackView.width
        viewModel.fightView.padding.height =  viewModel.fightView.height * viewDefaults.percentBackpackViewPadding
        
        viewModel.backpackView.items.width = viewModel.backpackView.width * viewDefaults.percentBackpackViewItems
        viewModel.backpackView.items.height =  viewModel.backpackView.height * viewDefaults.percentBackpackViewItemsAndArticles
        
        viewModel.backpackView.articles.width = viewModel.backpackView.width * viewDefaults.percentBackpackViewArticles
        viewModel.backpackView.articles.height =  viewModel.backpackView.height * viewDefaults.percentBackpackViewItemsAndArticles/12
        
        viewModel.backpackView.checkbox.width = viewModel.backpackView.items.width * viewDefaults.percentBackpackViewCheckbox
       // viewModel.backpackView.checkbox.height =  viewModel.backpackView.height * viewDefaults.percentFightViewName
        
        viewModel.backpackView.name.width = viewModel.backpackView.items.width * viewDefaults.percentBackpackViewNameWidth
        viewModel.backpackView.name.height =  viewModel.backpackView.height * viewDefaults.percentBackpackViewNameHeight/10
        
        viewModel.backpackView.info.width = viewModel.backpackView.items.width * viewDefaults.percentBackpackViewInfo
        
        viewModel.backpackView.more.width = viewModel.backpackView.width
        viewModel.backpackView.more.height = viewModel.backpackView.height * viewDefaults.percentBackpackViewMore
        
        
        viewModel.deadView.width = viewModel.gridView.grid.frameDim
        viewModel.deadView.height = viewModel.gridView.grid.frameDim
       
        viewModel.deadView.finalImage.width = viewModel.deadView.width * viewDefaults.percentDeadWidth
        viewModel.deadView.finalImage.height = viewModel.deadView.height * viewDefaults.percentDeadImage
        
        viewModel.deadView.finalText.width = viewModel.deadView.width * viewDefaults.percentDeadWidth
        viewModel.deadView.finalText.height = viewModel.deadView.height * viewDefaults.percentDeadText
        
        viewModel.deadView.finalButton.width = viewModel.deadView.width * viewDefaults.percentDeadWidth
        viewModel.deadView.finalButton.height = viewModel.deadView.height * viewDefaults.percentDeadButton
        
        return self.viewModel = viewModel
        
    }
    

    public func smallestGridDim(width: Double, height: Double) -> Double {
        
        if width > height {
            return height
        } else
        {
            return width
        }
    }
    
    public func calculateTabHeights(numberOfTabs: Int) -> [CGFloat]{
       
        
        viewModel.spinnerView.tab.heightPerTab =  (viewModel.spinnerView.tab.height)/Double(numberOfTabs)
        
        let totalHeightOffset = -1 * (viewModel.spinnerView.height/2 - viewModel.spinnerView.tab.heightPerTab/2)
        
        var tabHeights: [CGFloat] = Array(repeating: 0, count: numberOfTabs)
        
        for index in (0...(numberOfTabs - 1)) {
          
            tabHeights[numberOfTabs - index - 1] = (Double(index) * viewModel.spinnerView.tab.heightPerTab) + totalHeightOffset
        }
        return tabHeights
    }
}
  

    
    
