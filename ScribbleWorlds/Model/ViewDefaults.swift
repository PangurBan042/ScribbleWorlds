//
//  ViewDefaults.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 3/26/21.
//

import Foundation

struct ViewDefaults {
    
    // Number of Columns for Grid
    var numOfColumns:Int = 10

    //Number of Cells
    var numOfCells = 100
    // Number of Tabs
    var numberOfTabs: Int = 5
    // Opacity for grid frames
    // var opacityForFrames:Double =  0.6
    // Percentage of spacer between tab, grid, goals
    var spacerSize:Double = 0.01
    //Show grid labels
    var showGridLabels:Int = 1
    
    // Choose your own... View
    var percentNewHeader:Double = 0.10
    var percentAdventureHeader:Double = 0.10
    var percentCreatingHeader:Double = 0.10
    //var percentScrollAreaHeight:Double = 0.30
    var percentScrollAreaHeight:Double = 0.75
    var percentScrollAreaWidth:Double = 0.90
    var percentLoadingPadding:Double = 0.10
    var percentSidePadding:Double = 0.10
    var percentImageHeight:Double = 0.21
    var percentImageWidth:Double = 0.25
    var percentTitleHeight:Double = 0.065
    var percentTitleWidth:Double = 0.25
    var percentDeleteHeight:Double = 0.025
    var percentDeleteWidth:Double = 0.25
    
    
    // Padding for the left and right of screen
    var amountOfPadding:Int  = 10
    // Percentage of screen for spinner section
    var percentSpinnerView:Double = 0.25
    // Percentage of screen for grid section
    var percentGridView:Double = 0.70
    // Percentage of screen for navigation section
    var percentNavigatingView:Double = 0.05
    // Percentage of screen for goal section
    var percentGoalView:Double = 0.10
    
    
    // SPINNER/TAB/STAT
    var percentSpinnerPadding = 0.015
    var percentStat:Double = 0.30
    var percentSpinner:Double = 0.38
    var percentTab:Double = 0.25
   
    
    
    var percentStatPadding:Double = 0.025
    var percentStatToolSectionWidth:Double = 0.60
    var percentStatInfoSectionWidth:Double = 0.28
    var percentStatLevelNameHeight = 0.17
    var percentStatToolTypeHeight = 0.085
    var percentStatToolNameHeight = 0.085
   
   
    
    // NAVIGATION
    // Percentage of screen for navigation ArrowPadding section
    var percentNavigatingViewIconPadding:Double = 0.02
    // Percentage of screen for navigation LeftArrow section
    var percentNavigatingViewLeftArrow:Double = 0.10
    // Percentage of screen for navigation Backpack section
    var percentNavigatingViewBackPack:Double = 0.04
    // Percentage of screen for navigation Book section
    var percentNavigatingViewBook:Double = 0.04
    // Percentage of screen for navigation Stats section
    var percentNavigatingViewHelp:Double = 0.04
    // Percentage of screen for navigation Share section
    var percentNavigatingViewStats:Double = 0.30
    // Percentage of screen for navigation before Stats padding section
    var percentNavigatingViewBeforeStatsPadding:Double = 0.080
    // Percentage of screen for navigation after Stats padding section
    var percentNavigatingViewAfterStatsPadding:Double = 0.080
    // Percentage of screen for navigation Stats padding section
    var percentNavigatingViewStatsIcon:Double = 0.08
    // Percentage of screen for navigation Stats padding section
    var percentNavigatingViewStatsIconPadding:Double = 0.02
    // Percentage of screen for navigation Gear section
    var percentNavigatingViewGear:Double = 0.04
    // Percentage of screen for navigation Help section
    var percentNavigatingViewHome:Double = 0.04
    // Percentage of screen for navigation Help section
    var percentNavigatingViewShare:Double = 0.04
    // Percentage of screen for navigation RightArrow section
    var percentNavigatingViewRightArrow:Double = 0.10
    // Percentage of screen for navigation Help section
    var percentNavigatingViewIconHeight:Double = 0.60
    
   
    
    //GOAL Section
    // Percentage of screen for goal height padding section
    var percentGoalViewHeightPadding:Double = 0.80
    // Percentage of screen for goal title section
    var percentGoalViewTitle:Double = 0.15
    // Percentage of screen for title padding section
    var percentGoalViewTitlePadding:Double = 0.0
    // Percentage of screen for title padding section
    var percentGoalViewCheckbox:Double = 0.0
    // Percentage of screen for goal column sections
    var percentGoalViewColumn:Double = 0.40
    // Percentage of screen for goal column padding sections
    var percentGoalViewColumnPadding:Double = 0.05
    
    
    // Percentage of screen for padding
    var percentFightView: Double = 0.95
    // Percentage of screen for padding
    var percentFightViewPadding: Double = 0.025
    // Percentage of screen for name
    var percentFightViewName: Double = 0.125
    // Percentage of screen for B Fight
    var percentFightViewMajorFight: Double = 0.350
    // Percentage of screen for name
    var percentFightViewMinorHeading: Double = 0.075
    // Percentage of screen for Minor Fights
    var percentFightViewMinorFight: Double = 0.350
    
    
    // Percentage of sceen for Major Image
    var percentFightViewMajorFightImage: Double = 0.5
    // Percentage of sceen for Major Data
    var percentFightViewMajorFightData: Double = 0.5
    // Percentage of sceen for Major Image Info
    var percentFightViewMajorFightPadding: Double = 0.1
    // Percentage of sceen for Major Image Info
    var percentFightViewMajorFightInfo: Double = 0.6
    // Percentage of sceen for Major Image Life
    var percentFightViewMajorFightLife: Double = 0.3
    
    
    
    // Percentage of sceen for Minor Image
    var percentFightViewMinorFightTitle: Double = 0.1
    // Percentage of sceen for Minor Image
    var percentFightViewMinorFightImage: Double = 0.5
    // Percentage of sceen for Minor Image Name
    var percentFightViewMinorFightName: Double = 0.4
    

    // Percentage of screen for padding
    var percentBackpackView: Double = 0.9
    
    // Percentage of screen for padding
    var percentBackpackViewWidth: Double = 0.9
    // Percentage of screen for padding
    var percentBackpackViewHeight: Double = 0.9
    
    // Percentage of screen for padding
    var percentBackpackViewPadding: Double = 0.025
    // Percentage of screen for name
    var percentBackpackViewTitle: Double = 0.100
    // Percentage of screen for name
    var percentBackpackViewNameWidth: Double = 0.7
    // Percentage of screen for name
    var percentBackpackViewNameHeight: Double = 0.4
    // Percentage of screen for checkbox
    var percentBackpackViewCheckbox: Double = 0.3
    // Percentage of screen for checkbox
    var percentBackpackViewInfo: Double = 0.6
    // Percentage of screen for Items
    var percentBackpackViewItemsAndArticles: Double = 0.90
    // Percentage of screen for Items
    var percentBackpackViewItems: Double = 0.50
    // Percentage of screen for Articles
    var percentBackpackViewArticles: Double = 0.50
    // Percentage of screen for More...
    var percentBackpackViewMore: Double = 0.10
    
   
    // DEADVIEW
    var percentDeadWidth:Double = 0.80
    var percentDeadPadding:Double = 0.05
    var percentDeadSideMargin:Double = 0.20
    var percentDeadImage:Double = 0.60
    var percentDeadText:Double = 0.20
    var percentDeadButton:Double = 0.10
}
