//
//  MarvelViewController.swift
//  MarvelAPI Alamofire
//
//  Created by Радик Ахметзянов on 10.11.2022.
//

import UIKit
import SnapKit
import Alamofire


class MarvelViewController: UIViewController {
    
    var heroes: [Hero] = []
    
    // MARK: - Outlets
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(MarvelTableViewCell.self, forCellReuseIdentifier: MarvelTableViewCell.identifier)
        tableView.backgroundColor = .red
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setupHierarchy()
        setupLayout()
        fetchHero()
    }
    
    func setupNavigationController() {
        title = "MARVEL"
        navigationController?.navigationBar.backgroundColor = .red
        navigationController?.navigationBar.barTintColor = .red
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func fetchHero() {
        guard let url = marvelURL() else { return }
        let request = AF.request(url)
        request.responseDecodable(of: MarvelInfo.self) { (data) in
            guard let char = data.value else { return }
            let characters = char.data
            self.heroes = characters.results
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalTo(view)
        }
    }
}

extension MarvelViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MarvelTableViewCell.identifier, for: indexPath) as? MarvelTableViewCell
        cell?.hero = heroes[indexPath.row]
        cell?.backgroundColor = .white
        cell?.accessoryType = .disclosureIndicator
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = ModalViewController()
        present(viewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
        viewController.hero = heroes[indexPath.row]
    }
}
