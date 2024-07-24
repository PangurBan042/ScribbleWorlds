
//
//  ViewControllerAdventure.swift//  ViewController
//
//  Created by Franny Moyse on 3/26/21.
//

import SwiftUI
import Spinner
import PencilKit
import LinkPresentation


struct ViewControllerAdventure: View {
    
    @Binding var activeSheet: ActiveSheet?
    @ObservedObject var viewManager:ViewManager
    @ObservedObject var packViewModel: PackViewModel
    @StateObject var canvasViewModel = CanvasViewModel()
    @State var currentLand = ""
    @State var shareImage:UIImage = UIImage()
    @State var isReady:Bool = false
    @State var readInfo: Bool = false
    @State var takeSnapshot: Bool = false
    @State var shareSnapshot: Bool = false
    @State var showDrawing: Bool = true
    @State var characterIsDead: Bool = false
    @State var height:CGFloat = .infinity
    var opacityLevel = 0.6
    
    
    var body: some View {
        
        let _ = print("!!!In ViewControllerAdventure!!!")
        
        
        VStack (alignment: .center, spacing: 0) {
            
            if  currentLand != "" {
               
                SpinnerAndCanvasView(activeSheet: $activeSheet,
                                     viewManager: viewManager,
                                     packViewModel: packViewModel,
                                     canvasViewModel: canvasViewModel,
                                     currentLand: $currentLand,
                                     shareImage: $shareImage,
                                     isReady: $isReady,
                                     readInfo: $readInfo,
                                     takeSnapshot: $takeSnapshot,
                                     shareSnapshot: $shareSnapshot,
                                     showDrawing: $showDrawing,
                                     characterIsDead: $characterIsDead)
                .frame(height: viewManager.spinnerView.height + viewManager.gridView.grid.frameDim + viewManager.navigateView.height )
                
                ZStack {
                    GoalView(viewManager: viewManager,
                             currentLand: $currentLand,
                             packId: packViewModel.id)
                    
                    if !readInfo {
                        Rectangle()
                           // .frame(width: UIScreen.main.bounds.width, height: .infinity)
                            .foregroundColor(.gray)
                            .opacity(opacityLevel)
                            .ignoresSafeArea()
                            
                    }
                }
            }
        }
        .statusBar(hidden: true)
        .frame(width: UIScreen.main.bounds.width, height: height)
        .border(!shareSnapshot && takeSnapshot  ? .gray : .clear, width: 1)
        .onAppear(perform: {
            UIView.setAnimationsEnabled(true)
            currentLand = packViewModel.currentLand
            characterIsDead = packViewModel.characterIsDead
            
            
        })
        .onChange(of: currentLand) {
            packViewModel.currentLand = currentLand
            packViewModel.characterIsDead = characterIsDead
            packViewModel.updateData()
        }
        .onChange(of: takeSnapshot) {
            height = UIScreen.main.bounds.height
            getSnapshot()
            packViewModel.updateData()
        }
        
        .sheet(isPresented: $isReady){
            ShareSheet(shareImage: shareImage)
        }
       
        
        
    }
    
    
    func getSnapshot() {
        packViewModel.characterIsDead = characterIsDead
        canvasViewModel.updateData()
        Task {
            shareImage = postContent()
            let thumbnail = shareImage.preparingThumbnail(of: CGSize(width:UIScreen.main.bounds.width/2, height:UIScreen.main.bounds.width/2))
            let adventureViewModel = AdventureViewModel()
            adventureViewModel.getData(packId: packViewModel.id)
            adventureViewModel.packDate = Date()
            adventureViewModel.thumbnail = thumbnail?.pngData() ?? Data()
            
            if shareSnapshot {
                shareSnapshot.toggle()
                isReady.toggle()
            }
        }
    }
    
    private func postContent() -> UIImage {
        let gameImage = snapshot()
        let size = CGSize(width: gameImage.size.width, height: gameImage.size.height)
        let area = CGRect(x: 0, y: 0, width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        var drawingImage = UIImage()
        
        
        do {
            let pkdrawingData = try PKDrawing.init(data: canvasViewModel.data)
            let x = (UIScreen.main.bounds.width - viewManager.gridView.grid.frameDim)/2
            let y = (UIScreen.main.bounds.height - viewManager.gridView.grid.frameDim - viewManager.goalView.height)
            drawingImage = pkdrawingData.image(from: CGRect(x:0, y:0, width:viewManager.gridView.grid.frameDim, height: viewManager.gridView.grid.frameDim), scale:1)
            UIGraphicsBeginImageContext(size)
            gameImage.draw(in:area)
            let area = CGRect(x:x, y:y, width:viewManager.gridView.grid.frameDim, height:viewManager.gridView.grid.frameDim)
            if showDrawing {drawingImage.draw(in: area, blendMode: .normal, alpha: 1)}
            let renderedImage = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
            UIGraphicsEndImageContext()
            return renderedImage
        } catch { return UIImage()}
    }
    
    
}



struct ShareSheet: UIViewControllerRepresentable {
    let shareImage: UIImage
    
    
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        
        let item = ShareImage(placeholderItem: shareImage)
        let controller = UIActivityViewController(activityItems: [item], applicationActivities: nil)
        return controller
    }
    
    func updateUIViewController(_ vc: UIActivityViewController, context: Context) {
    }
}


class ShareImage: UIActivityItemProvider {
    var image: UIImage
    
    
    override var item: Any {
        get {
            return self.image
        }
    }
    
    override init(placeholderItem: Any) {
        guard let image = placeholderItem as? UIImage else {
            fatalError("Couldn't create image from provided item")
        }
        
        self.image = image
        super.init(placeholderItem: placeholderItem)
    }
    
    @available(iOS 13.0, *)
    override func activityViewControllerLinkMetadata(_ activityViewController: UIActivityViewController) -> LPLinkMetadata? {
        
        let metadata = LPLinkMetadata()
        metadata.title = "Fun from Scribble Worlds"
        metadata.originalURL = URL(string: "https://scribbleworlds.com/s")
        
        var thumbnail: NSSecureCoding = NSNull()
        if let imageData = self.image.pngData() {
            thumbnail = NSData(data: imageData)
        }
        
        metadata.imageProvider = NSItemProvider(item: thumbnail, typeIdentifier: "public.png")
        
        return metadata
    }
    
}


extension View {
    
    func snapshot() -> UIImage {
        
        
        let controller = UIHostingController(rootView: self)
        
        let view = controller.view
        
        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear
        
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}


struct SpinnerAndCanvasView: View {
    
    @Binding var activeSheet: ActiveSheet?
    @ObservedObject var viewManager:ViewManager
    @ObservedObject var packViewModel:PackViewModel
    @ObservedObject var canvasViewModel: CanvasViewModel
    @Binding var currentLand: String
    @Binding var shareImage:UIImage
    @Binding var isReady:Bool
    @Binding var readInfo:Bool
    @Binding var takeSnapshot: Bool
    @Binding var shareSnapshot: Bool
    @Binding var showDrawing: Bool
    @Binding var characterIsDead: Bool
    @StateObject var landViewModel: LandViewModel
    @StateObject var heartsViewModel: HeartsViewModel
    @StateObject var infoViewModel: InfoViewModel
    var dataViewModel = DataViewModel()
    @StateObject var fightViewModel: FightViewModel = FightViewModel()
    @StateObject var articleViewModel = ArticleViewModel()
    
    
    
    @State var updateViewModel = UpdateViewModel()
    var opacityLevel = 0.6
    
    init(activeSheet: Binding<ActiveSheet?>,
         viewManager: ViewManager,
         packViewModel: PackViewModel,
         canvasViewModel: CanvasViewModel,
         currentLand: Binding<String>,
         shareImage:  Binding<UIImage>,
         isReady:  Binding<Bool>,
         readInfo: Binding<Bool>,
         takeSnapshot: Binding<Bool>,
         shareSnapshot: Binding<Bool>,
         showDrawing: Binding<Bool>,
         characterIsDead: Binding<Bool>) {
        
        self._activeSheet = activeSheet
        self.viewManager = viewManager
        self.packViewModel = packViewModel
        self.canvasViewModel = canvasViewModel
        self._currentLand = currentLand
        self._shareImage = shareImage
        self._isReady = isReady
        self._readInfo = readInfo
        self._takeSnapshot = takeSnapshot
        self._shareSnapshot = shareSnapshot
        self._showDrawing = showDrawing
        self._characterIsDead = characterIsDead
        
        
        _landViewModel = StateObject(wrappedValue: { LandViewModel(packId:packViewModel.id, name: packViewModel.currentLand)}())
        
        _heartsViewModel = StateObject(wrappedValue: { HeartsViewModel(packId:packViewModel.id)}())
        
        _infoViewModel = StateObject(wrappedValue: { InfoViewModel(packId:packViewModel.id)}())
    }
    
    
    
    
    
    var body: some View {
            VStack(alignment:.center, spacing: 0) {
                
                
                
                    ZStack {
                        // Spacer()
                        
                        SpinnerView(
                            viewManager: viewManager,
                            landViewModel: landViewModel,
                            articleViewModel: articleViewModel,
                            infoViewModel: infoViewModel,
                            heartsViewModel: heartsViewModel,
                            fightViewModel: fightViewModel,
                            dataViewModel: dataViewModel,
                            updateViewModel: $updateViewModel,
                            currentLand: $currentLand)
                        
                        if !landViewModel.readInfo {
                            Rectangle()
                                .foregroundColor(.gray)
                                .opacity(opacityLevel)
                                .ignoresSafeArea()
                        }
                        
                    
                    
                }
                .frame(width:viewManager.spinnerView.width, height:viewManager.spinnerView.height)
                .fullBackground(imageName: landViewModel.currentTab + " Tab", width:viewManager.spinnerView.width, height:viewManager.spinnerView.height)
                
                
                NavigateAndScribbleView(activeSheet: $activeSheet,
                                        viewManager: viewManager,
                                        packViewModel: packViewModel,
                                        landViewModel: landViewModel,
                                        articleViewModel: articleViewModel,
                                        infoViewModel: infoViewModel,
                                        fightViewModel: fightViewModel,
                                        canvasViewModel: canvasViewModel,
                                        heartsViewModel: heartsViewModel,
                                        dataViewModel: dataViewModel,
                                        updateViewModel: $updateViewModel,
                                        currentLand: $currentLand,
                                        shareImage: $shareImage,
                                        isReady: $isReady,
                                        readInfo: $readInfo,
                                        takeSnapshot: $takeSnapshot,
                                        shareSnapshot: $shareSnapshot,
                                        showDrawing: $showDrawing,
                                        characterIsDead: $characterIsDead,
                                        helpPages: packViewModel.helpPages)
                
                
            }
            .onAppear(perform: {
                readInfo = landViewModel.readInfo
                landViewModel.getData(packId: packViewModel.id, name: currentLand)
                fightViewModel.getData(landId: landViewModel.id, name: landViewModel.currentFight)
                articleViewModel.getData(packId:packViewModel.id, name: fightViewModel.article)
                updateViewModel.characterIsDead = characterIsDead
                canvasViewModel.getData(landId: landViewModel.id)
                canvasViewModel.updateData()
                
            })
            .onChange(of: landViewModel.readInfo){
                readInfo = landViewModel.readInfo
            }
            .onChange(of: currentLand) {
                readInfo = landViewModel.readInfo
                canvasViewModel.updateData()
                landViewModel.updateData()
                landViewModel.getData(packId: packViewModel.id, name: currentLand)
                fightViewModel.getData(landId: landViewModel.id, name: landViewModel.currentFight)
                articleViewModel.getData(packId:packViewModel.id, name: fightViewModel.article)
                canvasViewModel.getData(landId: landViewModel.id)
                canvasViewModel.updateData()
            }
        
            .frame(width: viewManager.gridView.grid.frameDim, height: viewManager.gridView.grid.frameDim)
        }
    
}




struct NavigateAndScribbleView: View {
    
    
    
    @Binding var activeSheet: ActiveSheet?
    @ObservedObject var viewManager: ViewManager
    @ObservedObject var packViewModel: PackViewModel
    @ObservedObject var landViewModel: LandViewModel
    @ObservedObject var articleViewModel: ArticleViewModel
    @ObservedObject var infoViewModel: InfoViewModel
    @ObservedObject var fightViewModel: FightViewModel
    @ObservedObject var canvasViewModel: CanvasViewModel
    @ObservedObject var heartsViewModel: HeartsViewModel
    var dataViewModel: DataViewModel
    @Binding var updateViewModel: UpdateViewModel
    @Binding var currentLand: String
    @Binding var shareImage:UIImage
    @Binding var isReady:Bool
    @Binding var readInfo:Bool
    @Binding var takeSnapshot:Bool
    @Binding var shareSnapshot:Bool
    @Binding var showDrawing:Bool
    @Binding var characterIsDead:Bool
    var helpPages: [String]
    @StateObject var waterViewModel: WaterViewModel
    @StateObject var navigateViewModel: NavigateViewModel
   
    
    
    var opacityLevel = 0.6
    
    init(activeSheet: Binding<ActiveSheet?>,
         viewManager: ViewManager,
         packViewModel: PackViewModel,
         landViewModel: LandViewModel,
         articleViewModel: ArticleViewModel,
         infoViewModel: InfoViewModel,
         fightViewModel: FightViewModel,
         canvasViewModel: CanvasViewModel,
         heartsViewModel: HeartsViewModel,
         dataViewModel: DataViewModel,
         updateViewModel: Binding<UpdateViewModel>,
         currentLand: Binding<String>,
         shareImage:  Binding<UIImage>,
         isReady:  Binding<Bool>,
         readInfo: Binding<Bool>,
         takeSnapshot: Binding<Bool>,
         shareSnapshot: Binding<Bool>,
         showDrawing: Binding<Bool>,
         characterIsDead: Binding<Bool>,
         helpPages: [String]) {
        
        self._activeSheet = activeSheet
        self.viewManager = viewManager
        self.packViewModel = packViewModel
        self.landViewModel = landViewModel
        self.articleViewModel = articleViewModel
        self.infoViewModel = infoViewModel
        self.fightViewModel = fightViewModel
        self.canvasViewModel = canvasViewModel
        self.heartsViewModel = heartsViewModel
        self.dataViewModel = dataViewModel
        self._updateViewModel = updateViewModel
        self._currentLand = currentLand
        self._shareImage = shareImage
        self._isReady = isReady
        self._readInfo = readInfo
        self._takeSnapshot = takeSnapshot
        self._shareSnapshot = shareSnapshot
        self._showDrawing = showDrawing
        self._characterIsDead = characterIsDead
        self.helpPages = helpPages
        
        _waterViewModel = StateObject(wrappedValue: { WaterViewModel(packId:packViewModel.id)}())
        
        _navigateViewModel = StateObject(wrappedValue: { NavigateViewModel(packId:packViewModel.id)}())
        
    }
    
    
    
    
    
    var body: some View {
        
        VStack(alignment:.center, spacing: 0) {
            
            ZStack {
                
                NavigateViewAdventure(
                    viewManager: viewManager,
                    landViewModel: landViewModel,
                    navigateViewModel: navigateViewModel,
                    heartsViewModel: heartsViewModel,
                    waterViewModel: waterViewModel,
                    updateViewModel: $updateViewModel,
                    currentLand: $currentLand,
                    activeSheet: $activeSheet,
                    takeSnapshot: $takeSnapshot,
                    shareSnapshot: $shareSnapshot,
                    showDrawing: $showDrawing)
                .frame(width: viewManager.navigateView.width, height: viewManager.navigateView.height)
                
                if !landViewModel.readInfo {
                    Rectangle()
                        .foregroundColor(.gray)
                        .opacity(opacityLevel)
                }
            }
            .frame(width: viewManager.spinnerView.width, height: viewManager.navigateView.height)
            
            ZStack {
                
                if !landViewModel.readInfo {
                    Rectangle()
                        .foregroundColor(.gray)
                        .opacity(opacityLevel)
                }
                
                ScribbleView(viewManager: viewManager,
                             updateViewModel: $updateViewModel,
                             canvasViewModel: canvasViewModel,
                             landViewModel: landViewModel,
                             articleViewModel: articleViewModel,
                             navigateViewModel: navigateViewModel,
                             heartsViewModel: heartsViewModel,
                             waterViewModel: waterViewModel,
                             infoViewModel: infoViewModel,
                             fightViewModel: fightViewModel,
                             dataViewModel: dataViewModel,
                             characterIsDead: $characterIsDead,
                             helpPages: helpPages)
                
                .frame(width: viewManager.gridView.grid.frameDim, height: viewManager.gridView.grid.frameDim)
            }
            .frame(width: viewManager.spinnerView.width, height: viewManager.gridView.grid.frameDim)
        }
    }
}
