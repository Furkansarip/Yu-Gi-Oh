//
//  CardCell.swift
//  YuGiOhv2
//
//  Created by Furkan SARI (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 23.03.2023.
//

import UIKit

class CardCell: UITableViewCell {
    
    
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var cardType: UILabel!
    @IBOutlet weak var cardName: UILabel!
    @IBOutlet weak var cardDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardName.adjustsFontSizeToFitWidth = true
        cardDesc.numberOfLines = 0
        cardDesc.adjustsFontSizeToFitWidth = false
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func configure(with card:CardModel) {
        cardName.text = card.name
        cardType.text = card.type
        cardDesc.text = card.desc
        guard let urlString = card.cardImages?.first?.imageURL else { return }
        print(urlString)
        cardImage.downloadImage(cardURL: urlString)
        
    }
}
