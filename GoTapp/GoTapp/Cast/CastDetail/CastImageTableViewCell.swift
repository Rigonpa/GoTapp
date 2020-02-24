//
//  CastImageTableViewCell.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 24/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class CastImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageCast: UIImageView!
    
    override func awakeFromNib() {
        imageCast.layer.cornerRadius = 4.0
        imageCast.layer.borderWidth = 1.0
        imageCast.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
    }
    
    func setCastImage(_ cast: Cast?) {
        imageCast.image = UIImage.init(named: cast?.avatar ?? "")
    }
}
