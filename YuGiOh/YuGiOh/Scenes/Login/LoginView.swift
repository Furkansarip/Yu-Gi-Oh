//
//  LoginView.swift
//  YuGiOh
//
//  Created by Furkan Sarı on 18.03.2023.
//

import UIKit

class LoginView: UIView {
    
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let dividerView = UIView()
    let stackView = UIStackView()
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        //clipsToBounds = true
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
       
        stackView.backgroundColor = .systemBackground
        stackView.spacing = 8
        usernameTextField.placeholder = "Username"
        
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        dividerView.backgroundColor = .secondarySystemFill
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
                        stackView.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 3),
                        stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
                        stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
                        dividerView.heightAnchor.constraint(equalToConstant: 1)
                        //stackView.bottomAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.bottomAnchor, multiplier: -3)
            
        ])
        
        
    }
    
}
