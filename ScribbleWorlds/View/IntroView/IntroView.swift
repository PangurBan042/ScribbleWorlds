
//
//  IntroView.swift
//  ScribbleWorlds 1.1
//
//  Created by Franny Moyse on 6/11/22.
//

import SwiftUI


struct IntroView: View, Equatable {
    @StateObject var packViewModel: PackViewModel = PackViewModel()
    @State var opacityValue = 1.0
    @State var activeSheet: ActiveSheet? = nil
    @State var packId: UUID = UUID()
    @StateObject var viewManager:ViewManager = ViewManager()
    
    private var dontUpdate = true
    let color = #colorLiteral(red: 0.3412033021, green: 0.3035173118, blue: 0.2637621462, alpha: 1)

    var body: some View {
        
        let _ = print("!!!In IntroView!!!")
       
        VStack(alignment: .center) {
           
                
                //Title: Scribble Worlds
                Text("Scribble Worlds")
                    .font(Font.custom("WalterTurncoat-Regular", size:UIScreen.main.bounds.width * 0.10))
                    .foregroundColor(Color(color))
                    .padding()
                
                //Title: Spin, Create, and Discover
                Text("SPIN, CREATE, AND DISCOVER")
                    .font(Font.custom("Gaegu-Bold", size:UIScreen.main.bounds.width * 0.05))
                    .foregroundColor(Color.orange)
                
                //Scribble Worlds Image
                
                Image("ScribbleWorldsHomepageBundle")
                    .resizable()
                    .scaledToFit()
                    .frame(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 0.80)
                
                //New Adventure
                Button( action: {
                    viewManager.update(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height )
                    activeSheet = .newAdventure
                    UIView.setAnimationsEnabled(false)
                }) {
                    Text("NEW ADVENTURE")
                        .font(Font.custom("Gaegu-Bold", size:UIScreen.main.bounds.width * 0.05))
                        .foregroundColor(Color(color))
                }
                .hoverEffect()
                
                
                //Load Adventure
                Button( action: {
                    viewManager.update(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    activeSheet = .loadAdventure
                    UIView.setAnimationsEnabled(false)
                    
                }){
                    Text("LOAD ADVENTURE")
                        .font(Font.custom("Gaegu-Bold", size:UIScreen.main.bounds.width * 0.05))
                        .foregroundColor(Color(color))
                }
                .hoverEffect()
                
                
                //ABOUT
                Button( action: { activeSheet = .about} ) {
                    Text("ABOUT")
                        .font(Font.custom("Gaegu-Bold", size:UIScreen.main.bounds.width * 0.05))
                        .foregroundColor(Color(color))
                    
                }
        
        }
        
        .opacity(activeSheet == Optional.none ? 1.0 : 0.001)
        .fullScreenCover(
            item: self.$activeSheet) { item in
                
                switch item {
                case .newAdventure:
                    NewAdventureView(viewManager: viewManager, packViewModel: packViewModel, activeSheet: $activeSheet, packId: $packId)


                case .loadAdventure:
                    LoadAdventureView(viewManager: viewManager, packViewModel: packViewModel, activeSheet: $activeSheet, packId: $packId)
                 
                case .about:
                    AboutView(activeSheet: $activeSheet)
                    
                case .viewControllerAdventure:
                    ViewControllerAdventure(activeSheet: $activeSheet, viewManager:viewManager, packViewModel: packViewModel)
                    
                case .viewControllerCreating:
                    EmptyView()
//                    ViewControllerCreating(activeSheet: $activeSheet, packId:$packId, viewManager:viewManager)
                  

                case .none:
                    EmptyView()

                }
            }
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.dontUpdate == rhs.dontUpdate
    }
}



enum ActiveSheet: Identifiable {
    case newAdventure, loadAdventure, about, viewControllerAdventure, viewControllerCreating, none

    var id: Int {
        hashValue
    }
}



func downsample(imageName: String,
                to pointSize: CGSize,
                scale: CGFloat = UIScreen.main.scale) -> UIImage? {

    // Create an CGImageSource that represent an image
    var path = Bundle.main.path(forResource: imageName, ofType: "png")
    if path == nil {
        path = Bundle.main.path(forResource: "Scribble Default", ofType: "png")
    }
    let imageURL = URL(fileURLWithPath: path!)
    let imageSourceOptions = [kCGImageSourceShouldCache: false] as CFDictionary
    guard let imageSource = CGImageSourceCreateWithURL(imageURL as CFURL, imageSourceOptions) else {
        return nil
    }
    
    // Calculate the desired dimension
    let maxDimensionInPixels = max(pointSize.width, pointSize.height) * scale
    
    // Perform downsampling
    let downsampleOptions = [
        kCGImageSourceCreateThumbnailFromImageAlways: true,
        kCGImageSourceShouldCacheImmediately: true,
        kCGImageSourceCreateThumbnailWithTransform: true,
        kCGImageSourceThumbnailMaxPixelSize: maxDimensionInPixels
    ] as [CFString : Any] as CFDictionary
    guard let downsampledImage = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, downsampleOptions) else {
        return nil
    }
    
    
    // Return the downsampled image as UIImage
    return UIImage(cgImage: downsampledImage)
}

