//
//  Network.swift
//  Dojo2
//
//  Created by Renan Benatti Dias on 21/01/18.
//  Copyright © 2018 Blue Origami. All rights reserved.
//

import Foundation
import UIKit

protocol StarshipNetworkProtocol {
    func getShips(success: @escaping (([Starship]) -> Void), failure: @escaping ((Error) -> Void))
}

class Network {
    let baseUrl = "https://swapi.co/api/"
}

extension Network: StarshipNetworkProtocol {
    func getShips(success: @escaping (([Starship]) -> Void), failure: @escaping ((Error) -> Void)) {
        let stringURL = baseUrl + "starships/"
        guard let url = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                failure(error)
                return
            }
            
            guard let data = data else { return }
            do {
                let starshipResponse = try JSONDecoder().decode(StarshipEnclosure.self, from: data)
                success(starshipResponse.results!)
            } catch let jsonError {
                failure(jsonError)
            }
        }.resume()
    }
}
