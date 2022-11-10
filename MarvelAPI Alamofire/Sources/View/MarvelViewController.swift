//
//  MarvelViewController.swift
//  MarvelAPI Alamofire
//
//  Created by Радик Ахметзянов on 10.11.2022.
//

import UIKit

class MarvelViewController: UIViewController {
    
    // MARK: - Outlets
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(MarvelTableViewCell.self, forCellReuseIdentifier: MarvelTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MARVEL"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .red
        setupHierarchy()
        setupLayout()
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

