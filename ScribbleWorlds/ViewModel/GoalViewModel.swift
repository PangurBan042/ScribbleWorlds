//
//  GoalViewModel.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 4/30/24.
//

import Foundation


public class GoalViewModel: ObservableObject {
    
    @Published var goal = Goal()

    deinit {
        print("GoalManager is deinitialized")
    }

    public var id: UUID {
        get { return goal.id }
    }
    
    public var packId: UUID {
        get { return goal.packId }
    }
    
    public var currentLand: String {
        get { return goal.currentLand }
    }
    
    public var name: String {
        get { return goal.name }
    }
    
    public var on: Bool {
        get { return goal.on }
        set { goal.on = newValue
            CoreDataManager.instance.updateGoalOn(goal:goal)
        }
    }
    
    func getData(goalId:UUID) {
        let goalData =  CoreDataManager.instance.getGoal(goalId: goalId)
        goal.id = goalData.id
        goal.packId = goalData.packId
        goal.currentLand = goalData.currentLand
        goal.name = goalData.name
        goal.on = goalData.on
    }
    
    func getAllData(packId:UUID, currentLand: String) -> [Goal] {
        return  CoreDataManager.instance.getAllGoals(packId: packId, currentLand: currentLand)
    }
}
