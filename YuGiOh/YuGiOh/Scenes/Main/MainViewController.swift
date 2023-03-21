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
        let favoritesVC = FavoritesViewController()
        UITabBar.appearance().backgroundColor = .systemBackground
//        let nav1 = UINavigationController(rootViewController: cardsVC)
//        let nav2 = UINavigationController(rootViewController: settingsVC)
//        let nav3 = UINavigationController(rootViewController: favoritesVC)
//        nav1.tabBarItem = UITabBarItem(title: "Cards", image: UIImage(systemName: "greetingcard"), tag: 1)
//        nav2.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 3)
//        nav3.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart"), tag: 2)
        
        cardsVC.tabBarItem = UITabBarItem(title: "Cards", image: UIImage(systemName: "greetingcard"), tag: 1)
        settingsVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 3)
        favoritesVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart"), tag: 2)
        setViewControllers([cardsVC,favoritesVC,settingsVC], animated: true)
    }
    
}

