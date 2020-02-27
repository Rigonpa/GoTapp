//
//  HouseDataTableViewCell.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 27/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class HouseDataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var seat: UILabel!
    
    func setHouseData(_ house: House){
        word.text = house.words
        seat.text = house.seat
    }
}
