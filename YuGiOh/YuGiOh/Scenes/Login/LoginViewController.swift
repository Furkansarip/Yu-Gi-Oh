//
//  LoginViewController.swift
//  YuGiOh
//
//  Created by Furkan Sarı on 18.03.2023.
//

import UIKit

class LoginViewController: UIViewController {
    let loginView = LoginView()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .orange
        view.addSubview(loginView)
        login()
    }
    
    private func login() {
     
        NSLayoutConstraint.activate([
            
        ])
    }
    

}
