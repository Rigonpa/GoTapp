//
//  EpisodeTableViewCell.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 18/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {
   
    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var rateButton: UIButton!
    
    override func awakeFromNib() {
        thumb.layer.cornerRadius = 2.0
        thumb.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        thumb.layer.borderWidth = 1.0
        rateButton.layer.cornerRadius = 15
    }
    
    func setEpisode(_ episode: Episode){
        thumb.image = UIImage.init(named: episode.image ?? "")
        title.text = episode.name
        date.text = episode.date
    }
    
}
