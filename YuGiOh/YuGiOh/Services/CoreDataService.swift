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
    
    func addFavorite(cardID:String, cardName:String) {
        let entity = NSEntityDescription.entity(forEntityName: "Favorites", in: managedContext)!
        let favoriteCard = NSManagedObject(entity: entity, insertInto: managedContext)
        favoriteCard.setValue(cardID, forKey: "cardID")
        favoriteCard.setValue(cardName, forKey: "cardName")
        
        print(favoriteCard)
        do {
            try managedContext.save()
           
        } catch {
            print("Erro")
        }
        
    }
    
    func getFavoriteCards() -> [FavoriteCard] {
            let fetch = NSFetchRequest<NSManagedObject>(entityName: "Favorites")
            fetch.returnsObjectsAsFaults = false
            do {
                let favoritesCard = try managedContext.fetch(fetch)
                print(favoritesCard)
                return []
            } catch {
                print("Error")
            }
            return []
        }
}
