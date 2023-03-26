//
//  CoreDataService.swift
//  YuGiOh
//
//  Created by Furkan Sarı on 25.03.2023.
//

import UIKit
import CoreData

class CoreDataService {
    static let shared = CoreDataService()
    let managedContext : NSManagedObjectContext!
    public init(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedContext = appDelegate.persistentContainer.viewContext
        
    }
    
    func addFavorite(cardID:String, cardName:String, cardType:String) {
        let entity = NSEntityDescription.entity(forEntityName: "FavoriteCardLists", in: managedContext)!
        let favoriteCard = NSManagedObject(entity: entity, insertInto: managedContext)
        favoriteCard.setValue(cardID, forKey: "cardID")
        favoriteCard.setValue(cardName, forKey: "cardName")
        favoriteCard.setValue(cardType, forKey: "cardType")
        
        print(favoriteCard)
        do {
            try managedContext.save()
            
        } catch {
            print("Error")
        }
        
    }
    
    func getFavoriteCards() -> [FavoriteCardLists] {
        let fetch = NSFetchRequest<NSManagedObject>(entityName: "FavoriteCardLists")
        fetch.returnsObjectsAsFaults = false
        do {
            let favoritesCard = try managedContext.fetch(fetch)
            print(favoritesCard)
            return favoritesCard as! [FavoriteCardLists]
        } catch {
            print("Error")
        }
        return []
    }
}
