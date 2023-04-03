//
//  CardDetailViewController.swift
//  YuGiOh
//
//  Created by Furkan Sarı on 25.03.2023.
//

import UIKit

class CardDetailViewController: UIViewController {

    let cardID = 0
    let imageView = UIImageView()
    let statsDetailView = CardDetailView()
    let scrollView = UIScrollView()
    var cardInfo : CardModel? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let favButton = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(addFavorite))
        navigationItem.rightBarButtonItem = favButton
        configureViews()
        
        
    }
    
    private func configureViews() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        statsDetailView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        if let imageURL = cardInfo?.cardImages?[0].imageURL {
            imageView.downloadImage(cardURL: imageURL)
        }
        statsDetailView.configureView(cardInfo: cardInfo)
        imageView.contentMode = .scaleAspectFit
        
        
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(statsDetailView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            imageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 500),
            
            statsDetailView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            statsDetailView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            statsDetailView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            statsDetailView.heightAnchor.constraint(equalToConstant: 100),
            statsDetailView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10)
            
        ])
        
        
    }
    
    @objc func addFavorite() {
        guard let card = cardInfo else { return }
        let cardID : String = String(card.id ?? 0)
        CoreDataService.shared.addFavorite(cardID: cardID, cardName: card.name, cardType: card.type)
    }
    

}
