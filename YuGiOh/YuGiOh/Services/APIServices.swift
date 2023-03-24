//
//  APIServices.swift
//  YuGiOhv2
//
//  Created by Furkan SARI (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 22.03.2023.
//

import Foundation

enum APIServices {
    static func baseURL() -> String {
        return "https://db.ygoprodeck.com/api/v7/cardinfo.php?"
    }
}
