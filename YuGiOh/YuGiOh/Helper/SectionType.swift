//
//  SectionType.swift
//  YuGiOh
//
//  Created by Furkan Sarı on 26.03.2023.
//

import Foundation

enum SectionType : Int {
    case trapCard = 0
    case spellCard = 1
    case monsterCard = 2
    static var count = monsterCard.rawValue + 1
    var header : String {
        switch self {
        case .trapCard:
            return "Trap Cards"
        case .spellCard:
            return "Spell Cards"
        case.monsterCard:
            return "Monster Cards"
        }
    }
}
