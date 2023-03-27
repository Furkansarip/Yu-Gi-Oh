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
    var monsterList = [FavoriteCardLists]()
    var spellList = [FavoriteCardLists]()
    var trapList = [FavoriteCardLists]()
}


extension FavoriteViewModel : FavoriteViewModelProtocol {
    
    func getMonster() -> Int {
        monsterList = favoriteList.filter({$0.cardType?.lowercased().contains("monster") ?? true})
        return monsterList.count
    }
    
    func getSpell() -> Int {
        spellList = favoriteList.filter({$0.cardType?.lowercased().contains("spell") ?? true})
        return spellList.count
    }
    
    func getTrap() -> Int {
        trapList = favoriteList.filter({$0.cardType?.lowercased().contains("trap") ?? true})
        return trapList.count
    }
    
    func getFavorites() {
        favoriteList = CoreDataService.shared.getFavoriteCards()
        delegate?.favoritesLoaded()
        print("F",favoriteList.count)
    }
}
