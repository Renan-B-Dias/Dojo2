//
//  MainViewController.swift
//  Dojo2
//
//  Created by Renan Benatti Dias on 21/01/18.
//  Copyright © 2018 Blue Origami. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let network: StarshipNetworkProtocol = Network()
    
    var starships: [Starship]? {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyLaouts()
        configureTableView()
        
        network.getShips(success: { [weak self] (starships) in
            DispatchQueue.main.async {
                guard let strongSelf = self else { return }
                strongSelf.starships = starships
            }
        }, failure: { (error) in
            DispatchQueue.main.async {
                print("Oh não")
                print(error.localizedDescription)
            }
        })
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
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

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let starships = starships {
            return starships.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: StarshipCell.identifier, for: indexPath) as? StarshipCell, let starships = starships {
            cell.populateWith(starship: starships[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
