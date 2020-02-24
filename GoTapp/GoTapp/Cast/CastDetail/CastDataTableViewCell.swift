
//
//  CastDataTableViewCell.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 24/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class CastDataTableViewCell: UITableViewCell {
    
 
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var role: UILabel!
    @IBOutlet weak var episodesIn: UILabel!
    @IBOutlet weak var birthDate: UILabel!
    @IBOutlet weak var birthPlace: UILabel!

    
    override func awakeFromNib() {

    }
    
    func setCastData(_ cast: Cast?) {
        
        fullName.text = cast?.fullname
        let r = cast?.role
        role.text = "As \(String(r ?? ""))"
        let epi = cast?.episodes ?? 0
        episodesIn.text = "\(String(epi)) episodes in"
        let bd = cast?.birth ?? ""
        birthDate.text = "Birth date: \(String(bd))"
        let bp = cast?.placeBirth ?? ""
        birthPlace.text = "Birth place: \(String(bp))"
    
        
    }
}
