//
//  CardDetailView.swift
//  YuGiOh
//
//  Created by Furkan Sarı on 1.04.2023.
//

import UIKit

class CardDetailView: UIView {

    let attributeLabel = UILabel()
    let raceLabel = UILabel()
    let stackView = UIStackView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView(cardInfo: CardModel?) {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        stackView.axis = .horizontal
        if cardInfo?.attribute != nil {
            attributeLabel.text = "Attribute: \(cardInfo?.attribute ?? "")"
        } else {
            attributeLabel.text = "Archtype: \(cardInfo?.archetype ?? "")"
        }
        raceLabel.text = "Race: \(cardInfo?.race ?? "")"
        
        stackView.spacing = 5
        stackView.distribution = .fill
        stackView.addArrangedSubview(attributeLabel)
        stackView.addArrangedSubview(raceLabel)
       
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
    
    
}
