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
        title = "Favorites"
    }
    
    func configureTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getFavorites()
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
        let type = SectionType(rawValue: indexPath.section)
        switch type {
        case .monsterCard:
            cell.textLabel?.text = viewModel.monsterList[indexPath.row].cardName
        case .spellCard:
            cell.textLabel?.text = viewModel.spellList[indexPath.row].cardName
        case .trapCard:
            cell.textLabel?.text = viewModel.trapList[indexPath.row].cardName
        default:
            cell.textLabel?.text = "b"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let textColor = view as? UITableViewHeaderFooterView {
            let type = SectionType(rawValue: section)
            switch type {
            case .monsterCard:
                textColor.textLabel?.textColor = UIColor.typeColor(type: "monster")
            case .spellCard:
                textColor.textLabel?.textColor = UIColor.typeColor(type: "spell")
            case .trapCard:
                textColor.textLabel?.textColor = UIColor.typeColor(type: "trap")
            default:
                textColor.textLabel?.textColor = .systemBackground
            }
        }
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
