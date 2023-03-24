//
//  CardCell.swift
//  YuGiOhv2
//
//  Created by Furkan SARI (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 23.03.2023.
//

import UIKit

class CardCell: UITableViewCell {

    var cardImage : YuGiImage!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(with card:CardModel) {
     //print(card)
        print(card.cardImages?.first?.imageURL)
    }
}
