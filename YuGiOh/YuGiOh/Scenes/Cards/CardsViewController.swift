//
//  CardsViewController.swift
//  YuGiOh
//
//  Created by Furkan Sarı on 18.03.2023.
//

import UIKit
import MaterialActivityIndicator
protocol CardsViewProtocol : AnyObject {
    func cardsLoaded()
}

class CardsViewController: UIViewController {
    
    let viewModel = CardsViewModel()
    let activityIndicator = MaterialActivityIndicatorView()
    let tableView = UITableView(frame: .zero)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        indicatorSetup()
        viewModel.delegate = self
        view.backgroundColor = .systemBackground
        viewModel.viewDidLoad()
        title = "Cards"
        //navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(fetchData))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        print(viewModel.allData.count)
    }
    
    private func indicatorSetup() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CardCell", bundle: nil), forCellReuseIdentifier: "cardCell")
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc func fetchData() {
        print("fetch data")
    }
}

extension CardsViewController : CardsViewProtocol {
    func cardsLoaded() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            print(self.viewModel.allData.count)
            self.tableView.reloadData()
        }
        
    }
}

extension CardsViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as? CardCell else { return UITableViewCell() }
        let data = viewModel.allData[indexPath.row]
        cell.configure(with: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = viewModel.allData[indexPath.row]
        let dataID : String = String(data.id ?? 0)
        CoreDataService.shared.addFavorite(cardID:dataID , cardName: data.name, cardType: data.type)
        //navigationController?.pushViewController(CardDetailViewController(), animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
}
