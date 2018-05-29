//
//  Starship.swift
//  Dojo2
//
//  Created by Renan Benatti Dias on 21/01/18.
//  Copyright © 2018 Blue Origami. All rights reserved.
//

import Foundation
import ObjectMapper

class Starship: Mappable {
    var name: String?
    var model: String?
    var starshipClass: String?
    var manufacturer: String?
    var costInCredits: String?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        model <- map["model"]
        starshipClass <- map["starshipClass"]
        manufacturer <- map["manufacturer"]
        costInCredits <- map["costInCredits"]
    }
    
}
