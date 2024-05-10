//
//  GoalView.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 3/26/21.
//


//import Foundation
//import SwiftUI
//
//struct GoalView: View {
//    
//    @ObservedObject var viewManager: ViewManager
//    @Binding var currentLand: String
//    var packId: UUID
//   
//    
//    @StateObject var goalViewModel = GoalViewModel()
//    @State var goals = [Goal()]
//    @State var numberOfRows = 0
//    
//   
//    var body: some View {
//        
//        let _ = print("!!!In GoalView!!!")
//        
//        HStack(alignment: .top, spacing:0) {
//            VStack() {
//                Text("Goals")
//                    .font(Font.custom("WalterTurncoat-Regular", size:20))
//                    .foregroundColor(Color.black)
//                    .multilineTextAlignment(.leading)
//            }
//            .frame(width:viewManager.goalView.title.width, height: viewManager.goalView.title.height, alignment: .leading)
//            
//            
//            VStack(alignment: .trailing, spacing: 0) {
//                ForEach(0..<numberOfRows, id: \.self) {index in
//                    
//                    Button {
//                        goals[index].on.toggle()
//                        goalViewModel.getData(goalId:goals[index].id)
//                        goalViewModel.on.toggle()
//                    } label: {
//                        Image(systemName: goals[index].on ? "checkmark.square" : "square")
//                                .foregroundColor(.gray)
//                                .font(Font.title.weight(.bold))
//                                .padding(0)
//                        Text(goals[index].name)
//                            .font(Font.custom("WalterTurncoat-Regular", size:15))
//                            .foregroundColor(Color.black)
//                            .multilineTextAlignment(.leading)
//                        Spacer()
//                    }
//                }
//            }
//            .frame(width:viewManager.goalView.column.width, height: viewManager.goalView.column.height)
//            
//            
//            
//            Text("")
//                .frame(width: viewManager.goalView.columnPadding.width, height: viewManager.goalView.columnPadding.height)
//            
//            
//            VStack(alignment: .leading, spacing: 0) {
//                ForEach(numberOfRows..<goals.count, id: \.self) {index in
//                    
//                    Button{
//                        goals[index].on.toggle()
//                        goalViewModel.getData(goalId:goals[index].id)
//                        goalViewModel.on.toggle()
//                    } label: {
//                        Image(systemName: goals[index].on ? "checkmark.square" : "square")
//                                .foregroundColor(.gray)
//                                .font(Font.title.weight(.bold))
//                                .padding(0)
//                        Text(goals[index].name)
//                            .font(Font.custom("WalterTurncoat-Regular", size:15))
//                            .foregroundColor(Color.black)
//                            .multilineTextAlignment(.leading)
//                        Spacer()
//                            
//                    }
//            }
//            }
//            .frame(width:viewManager.goalView.column.width, height: viewManager.goalView.column.height)
//                
//            
//        } // End of HStack
//        .frame(width: viewManager.goalView.width, height: viewManager.goalView.height)
//        .onAppear(perform: {
//            goals = goalViewModel.getAllData(packId: packId, currentLand: currentLand)
//            numberOfRows = goals.count / 2
//            if goals.count % 2 == 1 {
//                numberOfRows += 1
//            }
//        })
//        .onChange(of: currentLand) {
//            goals = goalViewModel.getAllData(packId: packId, currentLand: currentLand)
//            numberOfRows = goals.count / 2
//            if goals.count % 2 == 1 {
//                numberOfRows += 1
//            }
//        }
//        
//    } // End of body view
//       
//} // End of ScribbleWorldsGoalView
//
//
//
