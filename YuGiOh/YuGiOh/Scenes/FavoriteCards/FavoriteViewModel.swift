//
//  FavoriteViewModel.swift
//  YuGiOh
//
//  Created by Furkan Sarı on 26.03.2023.
//

import Foundation
protocol FavoriteViewModelProtocol {
    func getFavorites()
    func getMonster() -> Int
    func getSpell() -> Int
    func getTrap() -> Int
    var  delegate : FavoriteViewProtocol? { get set }
}

class FavoriteViewModel {
    weak var delegate : FavoriteViewProtocol?
    var favoriteList = [FavoriteCardLists]()
    var filteredList = [FavoriteCardLists]()
}

extension FavoriteViewModel : FavoriteViewModelProtocol {
    func getMonster() -> Int {
         favoriteList.filter({ monster in
             if ((monster.cardType?.lowercased().contains("monster")) != nil) {
                filteredList.append(monster)
            }
             return true
        })
        
        return filteredList.count
    }
    
    func getSpell() -> Int {
        favoriteList.filter({ spell in
            if ((spell.cardType?.lowercased().contains("spell")) != nil) {
               filteredList.append(spell)
           }
            return true
       })
        
        return filteredList.count
    }
    
    func getTrap() -> Int {
        favoriteList.filter({ trap in
            if ((trap.cardType?.lowercased().contains("trap")) != nil) {
               filteredList.append(trap)
           }
            return
       })
        return filteredList.count
    }
    
   
    
    func getFavorites() {
        favoriteList = CoreDataService.shared.getFavoriteCards()
        
        delegate?.favoritesLoaded()
        print("F",favoriteList.count)
    }
    
}
