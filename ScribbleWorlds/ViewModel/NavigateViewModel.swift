//
//  NavigateViewModel.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 3/28/24.
//

//import Foundation
//
//class NavigateViewModel: ObservableObject {
//    
//    var id: UUID = UUID()
//    var packId: UUID = UUID()
//    @Published var menuSelection: String = ""
//    
//    init(packId: UUID) {
//        getData(packId: packId)
//    }
//    
//    func getData(packId:UUID) {
//        let navigateData =  CoreDataManager.instance.getNavigate(packId: packId)
//        id = navigateData.id
//        self.packId = navigateData.packId
//        menuSelection = navigateData.menuSelection
//       
//    }
//
//    
//    func updateData() {
//        CoreDataManager.instance.updateNavigate(id: id,
//                    menuSelection: menuSelection)
//    }
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//}
//
//
//
