//
//  ImageView+Ext.swift
//  YuGiOh
//
//  Created by Furkan Sarı on 24.03.2023.
//

import UIKit

extension UIImageView {
    func downloadImage(cardURL:String) {
        NetworkManager().getImage(imageURL: cardURL) { result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.image = UIImage(data: success)
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
