//
//  FavoriteViewController.swift
//  YuGiOh
//
//  Created by Furkan Sarı on 25.03.2023.
//

import UIKit
protocol FavoriteViewProtocol : AnyObject {
    func favoritesLoaded()
}

class FavoriteViewController: UIViewController {

    let tableView = UITableView(frame: .zero)
    let viewModel = FavoriteViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        viewModel.delegate = self
        viewModel.getFavorites()
    }
    
    func configureTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

extension FavoriteViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SectionType.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionHeader = SectionType(rawValue: section)
        return sectionHeader?.header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let type = SectionType(rawValue: section)
        switch type {
        case .monsterCard:
            return viewModel.getMonster()
        case .spellCard:
            return viewModel.getSpell()
        case .trapCard:
            return viewModel.getTrap()
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "H"
        return cell
    }
    
}

extension FavoriteViewController : FavoriteViewProtocol {
    func favoritesLoaded() {
        DispatchQueue.main.async {
            print("Hellor")
            self.tableView.reloadData()
        }
    }
    
    
}
