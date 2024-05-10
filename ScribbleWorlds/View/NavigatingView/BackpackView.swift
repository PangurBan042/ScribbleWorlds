//  BackpackView.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 9/30/22.
//

import Foundation
import SwiftUI

struct BackpackView: View {
    @ObservedObject var viewManager: ViewManager
    @ObservedObject var landViewModel: LandViewModel
    @ObservedObject var articleViewModel: ArticleViewModel
    @ObservedObject var heartsViewModel: HeartsViewModel
    @ObservedObject var infoViewModel: InfoViewModel
    var dataViewModel: DataViewModel
    @Binding var updateViewModel: UpdateViewModel
    @State var articles = [Article] ()
    let rows = [GridItem(.adaptive(minimum: 30, maximum: 50)),]
    
    var body: some View {
        
        let _ = print("!!!In BackpackView!!!")
        
        
        VStack (spacing: 0) {
            
            Text("Backpack Loot")
                .scaledFont(name: "WalterTurncoat-Regular", size: 25)
                .frame(width: viewManager.backpackView.title.width, height: viewManager.backpackView.title.height)
            
            if articles.count > 0 {
                
                HStack {
                    Text("")
                        .frame(width:viewManager.gridView.grid.frameDim * 0.02)
                    
                    ScrollView(.horizontal) {
                   
                        
                        LazyHGrid(rows:rows, alignment: .center, spacing: 16) {
                            
                            ForEach(0..<articles.count, id:\.self) {index in
                                
                                DisplayBackpackContent(
                                    viewManager: viewManager,
                                    landViewModel: landViewModel,
                                    articleViewModel: articleViewModel,
                                    heartsViewModel: heartsViewModel,
                                    infoViewModel: infoViewModel,
                                    dataViewModel: dataViewModel,
                                    updateViewModel: $updateViewModel,
                                    articles: $articles,
                                    article: $articles[index],
                                    index: index)
                                
                                
                            }
                        }.padding(.bottom)
                            .padding(.top)
                        
                    
                        }
                    Text("")
                        .frame(width:viewManager.gridView.grid.frameDim * 0.02)
                }
                
            }
        }
        
        .onAppear(perform: {
            articles = articleViewModel.getAllDataInOrder(packId: landViewModel.packId)
        })
        .onChange(of: updateViewModel.updateBackpack)  {
            articles = articleViewModel.getAllDataInOrder(packId: landViewModel.packId)
        }
        .frame(width: viewManager.gridView.grid.frameDim, height: viewManager.gridView.grid.frameDim)
        .background(Color.white)
        .border(.gray)
        .opacity(1.0)
        
    }
    
}





struct DisplayBackpackContent: View {
    @ObservedObject var viewManager: ViewManager
    @ObservedObject var landViewModel: LandViewModel
    @ObservedObject var articleViewModel: ArticleViewModel
    @ObservedObject var heartsViewModel: HeartsViewModel
    @ObservedObject var infoViewModel: InfoViewModel
    var dataViewModel: DataViewModel
    @Binding var updateViewModel: UpdateViewModel
    @Binding var articles: [Article]
    @Binding var article: Article
    @State var isPopover = false
    var index: Int
    
    var body: some View {
        
        VStack (alignment:.leading, spacing:0){
          
            HStack (alignment: .center, spacing: 0) {
                
                if (article.collected.count > 0) {
                    Text(articles[index].name+"   ")
                        .scaledFont(name:"WalterTurncoat-Regular", size: 16)
                        .multilineTextAlignment(.leading)
                        .minimumScaleFactor(0.1)
                        .lineLimit(1)
                        .foregroundColor(articles[index].collected.contains(true) ? .black : .gray)
                        .underline(articles[index].on.isEmpty ? true : false)
                        .onLongPressGesture(minimumDuration: 0.2) {
                            isPopover = true }
                        .popover(isPresented: $isPopover) {
                            PopoverContent(article:articles[index], isPopover: $isPopover)
                                .interactiveDismissDisabled()
                                
                        .padding()}
                } else {
                    Text(article.name+"   ")
                        .scaledFont(name:"WalterTurncoat-Regular", size: 16)
                        .multilineTextAlignment(.leading)
                        .minimumScaleFactor(0.1)
                        .lineLimit(1)
                        .underline(articles[index].on.isEmpty ? true : false)
                        .onLongPressGesture(minimumDuration: 0.2) {
                            isPopover = true }
                        .popover(isPresented: $isPopover) {
                            PopoverContent(article:articles[index], isPopover: $isPopover)
                                .interactiveDismissDisabled()
                                
                        .padding()}
                }
               
                
                
                ForEach(0..<article.on.count, id:\.self) { onIndex in
                    Button {
                        if article.collected[onIndex] {
                            if article.permanent {
                                updatePermanentArticle(onIndex: onIndex)
                            } else {
                               updateTemporaryArticle(onIndex: onIndex)
                            }
                        }
                    } label: {
                        Image(systemName: articles[index].on[onIndex] ? "checkmark.square" : "square")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(articles[index].collected[onIndex] ? .black : .gray)
                    } .frame(width:viewManager.backpackView.checkbox.width/Double(11))
                        .padding(2)
                }
                Spacer()
            }
            Spacer()
        }
    }
    
    
    func updatePermanentArticle(onIndex: Int) {
        var tempOn = article.on[onIndex]
        tempOn.toggle()
        let filteredArray = articles.filter { $0.category == article.category }
        for index in 0...filteredArray.count - 1 {
            let arrayIndex = articles.firstIndex(where: { $0.id == filteredArray[index].id })
            articles[arrayIndex!].on =  articles[arrayIndex!].on.map { _ in false }
        }
        article.on[onIndex] = tempOn
        articleViewModel.getData(articleId: article.id)
        articleViewModel.on[onIndex] = tempOn
        if tempOn {
            
            infoViewModel.updateInfoOn(category: article.category, name: article.name, value: article.value)
            dataViewModel.characterAttackPoints = infoViewModel.attackPoints
            dataViewModel.characterDefensePoints = infoViewModel.defensePoints
        } else {
            infoViewModel.updateInfoOff(category: article.category, value: article.value)
            dataViewModel.characterAttackPoints = infoViewModel.attackPoints
            dataViewModel.characterDefensePoints = infoViewModel.defensePoints
        }
    }
    
    func updateTemporaryArticle(onIndex: Int) {
        switch article.type {
            case "Heart": checkHeart(index: onIndex)
            default: updateArticle(index:onIndex)
        }
    }
    
    func updateArticle(index:Int) {
        article.on[index].toggle()
        articleViewModel.getData(articleId: article.id)
        articleViewModel.on[index] = article.on[index]
        landViewModel.currentArticles.append(article.name)
    }
    
    func checkHeart(index:Int) {
       
        var tempOn = article.on[index]
        tempOn.toggle()
        let numberOfFilledHearts = heartsViewModel.on.filter{$0 == true}.count
        let numberOfEmptyHearts = heartsViewModel.on.count - numberOfFilledHearts
        var additionalHearts = article.value
        
        if tempOn {
            additionalHearts *=  -1
        }
        
        if additionalHearts > 0 {
            
            if numberOfFilledHearts >= heartsViewModel.on.count {
                return
            }
            heartsViewModel.tempCount += additionalHearts
            if heartsViewModel.tempCount > heartsViewModel.on.count {
                additionalHearts = numberOfEmptyHearts
            }
            
            //convulted logic for edge case.
            if (heartsViewModel.tempCount - additionalHearts) <= 0  {
                additionalHearts = heartsViewModel.tempCount
            }
            
          
            if additionalHearts > 0 {
                for index in 0 ... (additionalHearts - 1) {
                    let heartIndex = numberOfFilledHearts + Int(index)
                    heartsViewModel.on[Int(heartIndex)] = true
                }
                heartsViewModel.count =  heartsViewModel.on.filter{$0 == true}.count
                updateViewModel.heartsCount = heartsViewModel.count
                updateArticle(index:index)
               
            }
        }
        
        if additionalHearts < 0 {
            
            if numberOfFilledHearts <= 0 {
                return
            }
            
            heartsViewModel.tempCount += additionalHearts
            
            //convulted logic for edge case
            if (heartsViewModel.tempCount - additionalHearts) >= heartsViewModel.on.count {
                additionalHearts = heartsViewModel.on.count - heartsViewModel.tempCount
            }
            
            if heartsViewModel.tempCount < 0 {
                additionalHearts = numberOfFilledHearts
            }
            
            additionalHearts = abs(additionalHearts)
           
            if additionalHearts > 0 {
                for index in 1 ... (additionalHearts) {
                    heartsViewModel.on[numberOfFilledHearts - Int(index)] = false
                }
                heartsViewModel.count =  heartsViewModel.on.filter{$0 == false}.count
                updateArticle(index:index)
            }
            
        }
    }
}
    

struct SectionHeaderView: View {
    
    var body: some View {
        HStack {
            Text("red")
                .font(.headline)
                .foregroundColor(.red)
            Spacer()
        }
        .padding()
        .background(Color.primary
            .colorInvert()
            .opacity(0.75))
    }
}

func calculateColumnIndex (index: Int) -> (start:Int, end:Int) {
    var start = 0
    var end = 1
    
    if index != 0 {
        start = index * 3 - 1
        end = start + 3
    }
    
    return(start, end)
}


func calculateContentIndex (column: Int, maxIndex: Int) -> (start:Int, end:Int) {
    
    let start = min(column * 15, maxIndex)
    let end = min((start + 15), maxIndex)
    
    return(start, end)
}

struct PopoverContent: View {
    var article: Article
    @Binding var isPopover:Bool
   
    
    var body: some View {
        
        HStack {
            Spacer()
            Button {
                isPopover = false
            } label: {
                Image(systemName: "xmark.circle")
                    .padding(10)
                    .foregroundColor(.black)
            }
        }
            
            VStack(alignment: .center) {
                
                Text("")
                
                Image(article.name)
                    .resizable()
                    .aspectRatio(contentMode:.fit)
                    .clipShape(Circle())
                
                
                Text("\(article.name)")
                    .font(.custom("Chalkduster", size: 16))
                    .lineLimit(2)
                    .minimumScaleFactor(0.3)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .frame(alignment: .center)
                
                Text("")
                Text("")
                
                Text("\(article.info)")
                    .font(.custom("Chalkduster", size: 16))
                    .lineLimit(4)
                    .minimumScaleFactor(0.3)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .frame(alignment: .center)
                
                Spacer()
                
                
            }
            .frame(width: 350, height: 200)
        }
    
}
