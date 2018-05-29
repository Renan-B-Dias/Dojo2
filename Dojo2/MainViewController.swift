//
//  MainViewController.swift
//  Dojo2
//
//  Created by Renan Benatti Dias on 21/01/18.
//  Copyright © 2018 Blue Origami. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let network: StarshipNetworkProtocol = Network()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyLaouts()
        configureTableView()
        
        network.getShips().asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: StarshipCell.identifier, cellType: StarshipCell.self)) { (row, starship, cell) in
                cell.populateWith(starship: starship)
            }
            .disposed(by: disposeBag)
        
        tableView.rx.itemSelected
            .bind { self.tableView.deselectRow(at: $0, animated: true) }
            .disposed(by: disposeBag)
        
//        network.getShips()
//            .subscribe { (event) in
//                switch event {
//                case .success(let starships):
//                    print(starships)
//                case .error(let error):
//                    print(error.localizedDescription)
//                }
//            }
//            .disposed(by: disposeBag)
    }
    
    private func configureTableView() {
        tableView.register(UINib(nibName: "StarshipCell", bundle: nil), forCellReuseIdentifier: StarshipCell.identifier)
    }
    
    private func applyLaouts() {
        navigationItem.title = "Starships"
        tableView.separatorColor = .clear
        
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
    }
}
