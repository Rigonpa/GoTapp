//
//  HouseImageTableViewCell.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 27/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class HouseImageTableViewCell: UITableViewCell{
    
    @IBOutlet weak var houseImage: UIImageView!
    
    
    override func awakeFromNib() {
        houseImage.layer.cornerRadius = 4.0
        houseImage.layer.borderWidth = 1.0
        houseImage.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
    }
    
    func setHouseImage(_ house: House){
        
        self.houseImage.image = UIImage.init(named: house.imageName)
        
    }
    
    
}
