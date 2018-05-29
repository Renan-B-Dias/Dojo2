//
//  StarshipCell.swift
//  Dojo2
//
//  Created by Renan Benatti Dias on 21/01/18.
//  Copyright © 2018 Blue Origami. All rights reserved.
//

import UIKit

class StarshipCell: UITableViewCell {
    
    static let identifier = "StarshipListCell"
    
    @IBOutlet weak var spaceImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        spaceImage.clipsToBounds = true
        self.spaceImage.image = #imageLiteral(resourceName: "spaceship")
    }
    
    func populateWith(starship: Starship) {
        nameLabel.text = starship.name
        modelLabel.text = starship.model
    }
    
}
