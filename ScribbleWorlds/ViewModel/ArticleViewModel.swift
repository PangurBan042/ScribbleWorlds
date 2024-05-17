//
//  ArticleManager.swift
//  ScribbleWorlds
//
//  Created by Franny Moyse on 10/24/22.
//

import Foundation


public class ArticleViewModel: ObservableObject {
    
    var article = Article()

    deinit {
        print("ArticleTestManager is deinitialized")
    }

    public var id: UUID {
        get { return article.id }
    }
    
    public var packId: UUID {
        get { return article.packId }
        set { article.packId = newValue}
    }
    
    public var name: String {
       
        get {
            return article.name }
    }
    
    public var category: String {
        get { return article.category }
    }
    
    
    public var type: String {
        get { return article.type }
    }
    
    public var permanent: Bool {
        get { return article.permanent }
    }
    
    public var info: String {
        get { return article.info }
    }
    
    public var collected: [Bool] {
        get { return article.collected }
        set { article.collected = newValue
           CoreDataManager.instance.updateArticleCollectedOn(article:article)
        }
           
    }
    
   
    public var value: Int {
        get { return article.value }
    }
    
    public var on: [Bool] {
        get { return article.on }
        set { article.on = newValue
           CoreDataManager.instance.updateArticleOn(article:article)
        }
           
    }
    

    func turnOffAllArticlesOfType() -> [Article] {
        var articles = getAllArticlesOfAType()
        for index in 0..<articles.count {
            if articles[index].on != [] { articles[index].on = [false] }
            CoreDataManager.instance.updateArticleOn(article:articles[index])
            
        }
        articles = getAllDataInOrder(packId:articles[0].packId)
        return articles
    }
    
    func getData(articleId:UUID) {
        let articleData =  CoreDataManager.instance.getArticle(articleId: articleId)
        article.id = articleData.id
        article.packId = articleData.packId
        article.name = articleData.name
        article.category = articleData.category
        article.type = articleData.type
        article.permanent = articleData.permanent
        article.info = articleData.info
        article.collected = articleData.collected
        article.value = articleData.value
        article.on = articleData.on
    }
    
    func getData(packId:UUID, name: String) {
        let articleData =  CoreDataManager.instance.getArticle(packId: packId, name:name)
        article.id = articleData.id
        article.packId = articleData.packId
        article.category = articleData.category
        article.name = articleData.name
        article.type = articleData.type
        article.permanent = articleData.permanent
        article.collected = articleData.collected
        article.info = articleData.info
        article.value = articleData.value
        article.on = articleData.on
    }
  
    func getAllDataInTypes(packId:UUID) -> ([Article],[Article], [Article], [Article], [Article], [Article], [Article]) {
        var armor = [Article]()
        var shield = [Article]()
        var helm = [Article]()
        var weapon = [Article]()
        var clothing = [Article]()
        var potion = [Article]()
        var item = [Article]()
        
        let articles = CoreDataManager.instance.getAllArticles(packId: packId)
        for article in articles {
            switch article.category {
            case "Armor":
                armor.append(article)
            case "Shield":
                shield.append(article)
            case "Helm":
                helm.append(article)
            case "Weapon":
                weapon.append(article)
            case "Clothing":
                clothing.append(article)
            case "Potion":
                potion.append(article)
            default:
                item.append(article)
            }
        }
        return (weapon, armor, shield, helm, clothing, potion, item)
    }
    
    func getAllDataInOrder(packId:UUID) -> ([Article]) {
        var armor = [Article]()
        var shield = [Article]()
        var helm = [Article]()
        var weapon = [Article]()
        var clothing = [Article]()
        var potion = [Article]()
        var jewel = [Article]()
        var coin = [Article]()
        var tool = [Article]()
        var item = [Article]()
        var monsterDrop = [Article]()
        var allArticles = [Article]()
        
        let articles = CoreDataManager.instance.getAllArticles(packId: packId)
        for article in articles {
            switch article.category {
            case "Armor":
                armor.append(article)
            case "Shield":
                shield.append(article)
            case "Helm":
                helm.append(article)
            case "Weapon":
                weapon.append(article)
            case "Tool":
                tool.append(article)
            case "Jewel":
                jewel.append(article)
            case "Coin":
                coin.append(article)
            case "Clothing":
                clothing.append(article)
            case "Potion":
                potion.append(article)
            case "Monster Drop":
                monsterDrop.append(article)
            default:
                item.append(article)
            }
        }
        allArticles.append(contentsOf: weapon)
        allArticles.append(contentsOf: armor)
        allArticles.append(contentsOf: shield)
        allArticles.append(contentsOf: helm)
        allArticles.append(contentsOf: tool)
        allArticles.append(contentsOf: potion)
        allArticles.append(contentsOf: coin)
        allArticles.append(contentsOf: jewel)
        allArticles.append(contentsOf: clothing)
        allArticles.append(contentsOf: item)
        allArticles.append(contentsOf: monsterDrop)
        
        return allArticles
    }
    
    
    func getAllArticlesOfAType() -> [Article] {
        let articles = CoreDataManager.instance.getAllArticles(packId: article.packId)
        return articles.filter{ $0.type == article.category }
    }
    
    func getAllData(packId:UUID) -> [Article] {
        return CoreDataManager.instance.getAllArticles(packId: packId)
    }
}
