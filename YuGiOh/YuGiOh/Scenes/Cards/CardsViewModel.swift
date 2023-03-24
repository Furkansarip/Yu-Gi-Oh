//
//  CardsViewModel.swift
//  YuGiOhv2
//
//  Created by Furkan SARI (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 22.03.2023.
//

import UIKit

protocol CardsViewModelProtocol {
    func viewDidLoad()
    func getCards()
    func dataCount() -> Int
    var delegate : CardsViewProtocol? { get set }
}

final class CardsViewModel {
    weak var delegate : CardsViewProtocol?
    private var service = NetworkManager()
    var allData = [CardModel]()
}

extension CardsViewModel : CardsViewModelProtocol {
    func viewDidLoad() {
        getCards()
    }
    
    func getCards() {
        service.getData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                guard let data = data?.data else { return }
                self.allData = data
                self.delegate?.cardsLoaded()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func dataCount() -> Int {
        return allData.count
    }
    
   
    
    
}
