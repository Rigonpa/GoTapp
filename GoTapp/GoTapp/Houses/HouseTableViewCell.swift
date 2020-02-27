//
//  HouseTableViewCell.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 19/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class HouseTableViewCell: UITableViewCell {
    
    @IBOutlet weak var shield: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var words: UILabel!
    @IBOutlet weak var seat: UILabel!
  
    
    override func awakeFromNib() {
        
        shield.layer.cornerRadius = 4.0
        shield.layer.borderWidth = 1.0
        shield.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        
    }
    
    func setHouse(_ house: House) {
        self.shield.image = UIImage.init(named: house.imageName)
        self.name.text = house.name
        self.words.text = house.words
        self.seat.text = house.seat
        
    }
    
    
}
