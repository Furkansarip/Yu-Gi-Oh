//
//  UIColor+Ext.swift
//  YuGiOh
//
//  Created by Furkan Sarı on 25.03.2023.
//

import UIKit

extension UIColor {
    static func typeColor(type:String) -> UIColor {
        if type.lowercased().contains("spell") {
            return .systemTeal
        } else if type.lowercased().contains("monster") {
            return .brown
        } else if type.lowercased().contains("trap") {
            return .systemPink
        } else {
            return .blue
        }
    }
}
