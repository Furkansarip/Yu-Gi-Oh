//
//  ViewController.swift
//  YuGiOh
//
//  Created by Furkan Sarı on 18.03.2023.
//

import UIKit

final class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupTabs()
        
    }
    
    private func setupTabs() {
        let cardsVC = CardsViewController()
        let settingsVC = SettingsViewController()
        UITabBar.appearance().backgroundColor = .systemBackground
        let nav1 = UINavigationController(rootViewController: cardsVC)
        let nav2 = UINavigationController(rootViewController: settingsVC)
        nav1.tabBarItem = UITabBarItem(title: "Cards", image: UIImage(systemName: "greetingcard"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 2)
        setViewControllers([nav1,nav2], animated: true)
    }
    
}

