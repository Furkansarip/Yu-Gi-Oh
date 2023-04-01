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
        
        scrollView.indicatorStyle = .black
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
            imageView.heightAnchor.constraint(equalToConstant: 400),
            
            statsDetailView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            statsDetailView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            statsDetailView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            statsDetailView.heightAnchor.constraint(equalToConstant: 100),
            statsDetailView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10)
            
        ])
        
        
    }
    

}
