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
    @IBOutlet weak var heart: UIButton!
    
    private var house: House?
    
    var delegateHouse: FavoriteHouseDelegate?
    
    override func awakeFromNib() {
        
        shield.layer.cornerRadius = 4.0
        shield.layer.borderWidth = 1.0
        shield.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        
    }
    
    func setHouse(_ house: House) {
        
        self.house = house
        
        self.shield.image = UIImage.init(named: house.imageName)
        self.name.text = house.name
        self.words.text = house.words
        self.seat.text = house.seat
        
        let favHouse = DataController.shared.isFavoriteHouse(house) ? "heart.fill" : "heart"
        heart.setImage(UIImage.init(systemName: favHouse), for: .normal)
        
    }
    
    @IBAction func favoriteHouse(_ sender: Any) {
        
        if let housePip = self.house {
            
            if DataController.shared.isFavoriteHouse(housePip) {
                DataController.shared.removeFavoriteHouse(housePip)
            } else {
                DataController.shared.addFavoriteHouse(housePip)
            }
            self.delegateHouse?.didFavoriteHouseChanged()
        }
    }
    
    
}
