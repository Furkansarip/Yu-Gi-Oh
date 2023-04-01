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
        backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView(cardInfo: CardModel?) {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        print(cardInfo?.attribute)
        addSubview(stackView)
        stackView.axis = .horizontal
        attributeLabel.text = "Attribute : \(cardInfo?.attribute ?? "")"
        raceLabel.text = "Race: \(cardInfo?.race ?? "")"
        stackView.backgroundColor = .red
        stackView.spacing = 5
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
