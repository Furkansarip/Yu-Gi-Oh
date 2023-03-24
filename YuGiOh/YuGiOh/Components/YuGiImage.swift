//
//  YuGiImage.swift
//  YuGiOh
//
//  Created by Furkan Sarı on 24.03.2023.
//

import UIKit

class YuGiImage: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureButton() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        
    }

}
