//
//  Starship.swift
//  Dojo2
//
//  Created by Renan Benatti Dias on 21/01/18.
//  Copyright © 2018 Blue Origami. All rights reserved.
//

import Foundation

class Starship: Decodable {
    var name: String?
    var model: String?
    var starshipClass: String?
    var manufacturer: String?
    var costInCredits: String?
    var length: String?
    var crew: String?
    var passengers: String?
    var maxAtmospheringSpeed: String?
    var hyperdriveRating: String?
    var MGLT: String?
    var cargoCapacity: String?
    var consumables: String?
    //    var films: [FilmsAPI]?
    //    var pilots: [People]?
    var url: URL?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case model
        case starshipClass = "starship_class"
        case manufacturer
        case costInCredits = "costIn_credits"
        case length
        case crew
        case passengers
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case hyperdriveRating = "hyperdrive_rating"
        case MGLT
        case cargoCapacity = "cargo_capacity"
        case consumables
        case url
    }
}
