//
//  StarshipEnclosure.swift
//  Dojo2
//
//  Created by Renan Benatti Dias on 21/01/18.
//  Copyright © 2018 Blue Origami. All rights reserved.
//

import Foundation

class StarshipEnclosure: Decodable {
    var count: Int?
    var next: String?
    var previous: String?
    var results: [Starship]?
}
