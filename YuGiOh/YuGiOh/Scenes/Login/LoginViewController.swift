//
//  LoginViewController.swift
//  YuGiOh
//
//  Created by Furkan Sarı on 18.03.2023.
//

import UIKit

class LoginViewController: UIViewController {
    let loginView = LoginView()
    let titleLabel = UILabel()
    let loginButton = YuGiButton(type: .system)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(loginView)
        
        configure()
    }
    
    private func configure() {
        titleLabel.text = "Yu-Gi-Oh"
        titleLabel.font = .preferredFont(forTextStyle: .largeTitle)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        //loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        view.addSubview(titleLabel)
        view.addSubview(loginButton)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 32),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginView.heightAnchor.constraint(equalToConstant: 100),
            loginView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            loginView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 3),
            
            loginButton.topAnchor.constraint(equalTo: loginView.bottomAnchor, constant: 10),
            loginButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            loginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
    }
    

    @objc func login() {
        let tabBarVC = MainViewController()
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC,animated: true)
    }
}
