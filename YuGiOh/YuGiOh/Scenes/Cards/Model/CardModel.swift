//
//  CardModel.swift
//  YuGiOhv2
//
//  Created by Furkan SARI (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 22.03.2023.
//

import Foundation

struct CardModel : Codable {
    let id: Int?
    let name, type, frameType, desc: String
    let race, archetype: String?
    let cardSets: [CardSet]?
    let cardImages: [CardImage]?
    let cardPrices: [CardPrice]?
    let attribute: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, type, frameType, desc, race, archetype, attribute
        case cardSets = "card_sets"
        case cardImages = "card_images"
        case cardPrices = "card_prices"
    }
}

struct CardImage: Codable {
    let id: Int?
    let imageURL, imageURLSmall, imageURLCropped: String?

    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "image_url"
        case imageURLSmall = "image_url_small"
        case imageURLCropped = "image_url_cropped"
    }
}

// MARK: - CardPrice
struct CardPrice: Codable {
    let cardmarketPrice, tcgplayerPrice, ebayPrice, amazonPrice: String?
    let coolstuffincPrice: String?

    enum CodingKeys: String, CodingKey {
        case cardmarketPrice = "cardmarket_price"
        case tcgplayerPrice = "tcgplayer_price"
        case ebayPrice = "ebay_price"
        case amazonPrice = "amazon_price"
        case coolstuffincPrice = "coolstuffinc_price"
    }
}

// MARK: - CardSet
struct CardSet: Codable {
    let setName, setCode, setRarity, setRarityCode: String?
    let setPrice: String?

    enum CodingKeys: String, CodingKey {
        case setName = "set_name"
        case setCode = "set_code"
        case setRarity = "set_rarity"
        case setRarityCode = "set_rarity_code"
        case setPrice = "set_price"
    }
}

struct FavoriteCardList  {
    let cardID : String
    let cardName: String
    let cardType: String
}
