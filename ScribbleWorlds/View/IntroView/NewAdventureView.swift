//
// NewAdventureView.swift
// ScribbleWorlds 1.1
//
// Created by Franny Moyse on 6/13/22.
//

import SwiftUI

struct NewAdventureView: View {
    @ObservedObject var viewManager: ViewManager
    @ObservedObject var packViewModel: PackViewModel
    @Binding var activeSheet:ActiveSheet?
    
    var body: some View {
        ZStack {
        }
        .onAppear(perform: {
            if activeSheet == .newAdventure {
                packViewModel.addData(packName:"The Original Adventure")
                activeSheet = .viewControllerAdventure
            }
        })
        
    }
}
    
        
        
                      
            












////
//// NewAdventureView.swift
//// ScribbleWorlds 1.1
////
//// Created by Franny Moyse on 6/13/22.
////
//
//import SwiftUI
//
//struct NewAdventureView: View {
//    @ObservedObject var viewManager: ViewManager
//    @Binding var activeSheet:ActiveSheet?
//    @State var packId: UUID = UUID()
//    var packManager: PackTestManager = PackTestManager()
//    var allAdventurePacks = AllPacks.getData(from: "All Adventure Packs")
//    var allCreatePacks = AllPacks.getData(from: "All Creating Packs")
//    
//    
//    var color = #colorLiteral(red: 0.3412033021, green: 0.3035173118, blue: 0.2637621462, alpha: 1)
//    var backgroundColor = #colorLiteral(red: 0.8627451062, green: 0.8627452254, blue: 0.8670507073, alpha: 1)
//    
//    
//    var body: some View {
//        
//        let _ = print("!!!In NewAdventureView!!!")
//        
//        VStack {
//            
//            HStack {
//                
//                Button {
//                    activeSheet = Optional.none
//                } label: {
//                    
//                    Image(systemName: "arrow.backward")
//                        .resizable()
//                        .scaledToFit()
//                        .foregroundColor(Color(color))
//                }
//                .frame(width:UIScreen.main.bounds.width * 0.10, height:UIScreen.main.bounds.height * 0.015)
//                
//                Text("Choose Your Own...")
//                    .lineLimit(1)
//                    .minimumScaleFactor(0.5)
//                    .font(Font.custom("WalterTurncoat-Regular", size:UIScreen.main.bounds.width * 0.08, relativeTo: .title))
//                    .frame(width:UIScreen.main.bounds.width * 0.80,
//                           height:UIScreen.main.bounds.height * 0.10)
//                
//                Text("")
//                    .frame(width:UIScreen.main.bounds.width * 0.10)
//                
//            }
//            .foregroundColor(Color(color))
//            .background(.quaternary)
//            .frame(width:UIScreen.main.bounds.width, height: viewManager.newView.headerHeight, alignment:.leading)
//            
//            
//            Text("Adventure")
//                .frame(height:viewManager.newView.adventureHeaderHeight)
//                .font(Font.custom("WalterTurncoat-Regular", size:UIScreen.main.bounds.width * 0.08, relativeTo: .title))
//                .foregroundColor(Color(color))
//            
//            ScrollView(.horizontal, showsIndicators: false) {
//                
//                HStack(spacing: 20) {
//                    
//                    ForEach(allAdventurePacks, id:\.id) { pack in
//                        Button {
//                            packManager.addData(packName:pack.name)
//                            packId = packManager.id
//                            activeSheet = .viewControllerAdventure
//                        } label : {
//                            VStack {
//                                let startImage = downsample(imageName: "ScribbleWorldsHomepageBundle", to: (CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)))
//                                
//                                Image(uiImage: startImage ?? UIImage())
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width:viewManager.newView.image.width, height:viewManager.newView.image.height)
//                                    
//                                Text(pack.name)
//                                    .font(Font.custom("WalterTurncoat-Regular", size: UIScreen.main.bounds.width * 0.030))
//                                    .multilineTextAlignment(.center)
//                                    .lineLimit(nil)
//                                    .foregroundColor(Color(color))
//                                    .frame(width:viewManager.newView.title.width, height:viewManager.newView.title.height)
//                                
//                                
//                            }
//                            .frame(width:viewManager.newView.scrollAreaWidth/3, height:viewManager.newView.scrollAreaHeight)
//                           
//                            
//                        }
//                    }
//                }
//            }
//            .frame(width:viewManager.newView.scrollAreaWidth, height:viewManager.newView.scrollAreaHeight)
//            
//            Text("Creating")
//                .frame(height: viewManager.newView.creatingHeaderHeight)
//                .font(Font.custom("WalterTurncoat-Regular", size:UIScreen.main.bounds.width * 0.08, relativeTo: .title))
//                .foregroundColor(Color(color))
//            
//            
//            ScrollView(.horizontal, showsIndicators: false) {
//                
//                HStack(spacing: 20) {
//                    
//                    ForEach(allCreatePacks, id:\.id) { pack in
//                        Button {
//                            packManager.addData(packName:pack.name)
//                            packId = packManager.id
//                            activeSheet = .viewControllerCreating
//                        } label : {
//                            VStack {
//                                let startImage = downsample(imageName: "ScribbleWorldsHomepageBundle", to: (CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)))
//                                
//                                Image(uiImage: startImage ?? UIImage())
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width:viewManager.newView.image.width, height:viewManager.newView.image.height)
//                                Text(pack.name)
//                                    .font(Font.custom("WalterTurncoat-Regular", size: UIScreen.main.bounds.width * 0.030))
//                                    .multilineTextAlignment(.center)
//                                    .lineLimit(nil)
//                                    .foregroundColor(Color(color))
//                                    .frame(width:viewManager.newView.title.width, height:viewManager.newView.title.height)
//                                
//                            }
//                            
//                            .frame(width: viewManager.newView.scrollAreaWidth/3, height: viewManager.newView.scrollAreaHeight)
//                            
//                            
//                        }
//                    }
//                }
//            }
//            .frame(width:viewManager.newView.scrollAreaWidth, height:viewManager.newView.scrollAreaHeight)
//            
//            Spacer()
//        }
//    }
//}
//            
//
//
//
//
//
//struct TextView: UIViewRepresentable {
//    var text: String
//    
//    func makeUIView(context: Context) -> UITextView {
//        let textView = UITextView()
//        textView.font = UIFont(name: "Gaegu-Regular", size: UIScreen.main.bounds.width * 0.03)
//        textView.textAlignment = .justified
//        textView.isEditable = false
//        return textView
//    }
//    
//    func updateUIView(_ uiView: UITextView, context: Context) {
//        uiView.text = text
//    }
//}
