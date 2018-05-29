//
//  StarshipEnclosure.swift
//  Dojo2
//
//  Created by Renan Benatti Dias on 21/01/18.
//  Copyright © 2018 Blue Origami. All rights reserved.
//

import Foundation
import ObjectMapper

class StarshipEnclosure: Mappable {
    
    var count: Int?
    var next: URL?
    var previous: URL?
    var results: [Starship]?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        count <- map["count"]
        next <- ( map["next"], URLTransform())
        previous <- ( map["previoud"], URLTransform() )
        results <- map["results"]
    }
    
}
