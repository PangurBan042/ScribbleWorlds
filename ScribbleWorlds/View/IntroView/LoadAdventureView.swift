//
// LoadAdventureView.swift
// ScribbleWorlds 1.1
//
// Created by Franny Moyse on 6/13/22.
//

import SwiftUI

struct LoadAdventureView: View {
    @ObservedObject var viewManager: ViewManager
    @ObservedObject var packViewModel: PackViewModel = PackViewModel()
    @Binding var activeSheet:ActiveSheet?
    
    @State var adventureViewModel: AdventureViewModel = AdventureViewModel()
    @State var allAdventurePacks: [Adventure] = [Adventure]()
    @State private var overText = false
    let layout = [
        GridItem(.adaptive(minimum: 400)),
    ]
    
    
    var color = #colorLiteral(red: 0.3412033021, green: 0.3035173118, blue: 0.2637621462, alpha: 1)
    var backgroundColor = #colorLiteral(red: 0.8627451062, green: 0.8627452254, blue: 0.8670507073, alpha: 1)
    
    
    var body: some View {
        
        let _ = print("!!!In LoadAdventureView!!!")
        
        VStack (spacing: 0){
            
            HStack (spacing:0) {
                
                Button {
                    activeSheet = Optional.none
                } label: {
                    
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color(color))
                    
                }
                .frame(width:UIScreen.main.bounds.width * 0.10, height:UIScreen.main.bounds.height * 0.015)
                
                
                Text("Loading Your...")
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .font(Font.custom("WalterTurncoat-Regular", size:UIScreen.main.bounds.width * 0.08, relativeTo: .title))
                    .frame(width:UIScreen.main.bounds.width * 0.80,
                           height:UIScreen.main.bounds.height * 0.10)
                
                Text("")
                    .frame(width:UIScreen.main.bounds.width * 0.10)
                
            }
            .foregroundColor(Color(color))
            .background(.quaternary)
            .frame(width:UIScreen.main.bounds.width, height: viewManager.newView.headerHeight, alignment:.leading)
            
            
            
            Text("Adventure")
                .frame(height:viewManager.newView.adventureHeaderHeight)
                .font(Font.custom("WalterTurncoat-Regular", size:UIScreen.main.bounds.width * 0.08, relativeTo: .title))
                .foregroundColor(Color(color))
            
            ScrollView(.vertical, showsIndicators: true) {
                
                LazyVGrid(columns:layout) {
                    
                    ForEach(allAdventurePacks, id:\.id) { adventure in
                        
                        VStack (alignment: .center, spacing:0){
                            
                            Button {
                               packViewModel.getData(packId: adventure.packId)
                                activeSheet = .viewControllerAdventure
                            } label : {
                                VStack (spacing:0){
                                    let startImage = UIImage(data: adventure.thumbnail)
                                    Image(uiImage: startImage ?? UIImage())
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width:viewManager.newView.image  .width, height:viewManager.newView.image.height)
                                        
                                    
                                    Text(adventure.packName)
                                        .font(Font.custom("WalterTurncoat-Regular",    size: UIScreen.main.bounds.width * 0.030))
                                        .multilineTextAlignment(.center)
                                        .lineLimit(nil)
                                        .foregroundColor(Color(color))
                                        .frame(width:viewManager.newView.title.width, height:viewManager.newView.title.height)
                                }
                                .frame(width:viewManager.newView.scrollAreaWidth/3)
                                
                                
                            }
                            
                            Button {
                                packViewModel.deleteData(id: adventure.packId)
                                adventureViewModel.deleteData(id: adventure.id)
                                allAdventurePacks = adventureViewModel.getAllAdventures()
                                allAdventurePacks.sort(by: {$0.packDate > $1.packDate})
                            } label: {
                                Image(systemName:"trash")
                                    .foregroundColor(overText ? .red : .black)
                                    .onHover { over in
                                        overText = over
                                    }
                            }
                            .frame(width:viewManager.newView.delete.width, height:viewManager.newView.delete.height)
                            
                            Text("")
                                .frame(height:viewManager.newView.adventureHeaderHeight)
                            
                        }
                    }
                    
                }
                
            }
            .frame(width: viewManager.newView.scrollAreaWidth, height:viewManager.newView.scrollAreaHeight, alignment: .center)

            Spacer()
        }
        .statusBar(hidden: true)
        .onAppear(perform: {
            allAdventurePacks = adventureViewModel.getAllAdventures()
            allAdventurePacks.sort(by: {$0.packDate > $1.packDate})
        })
    }
}
