//
//  EpisodeImageTableViewCell.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 24/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class EpisodeImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var episodeImage: UIImageView!
    
    override func awakeFromNib() {
        episodeImage.layer.cornerRadius = 4.0
        //episodeImage.layer.borderWidth = 1.0
        //episodeImage.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
    }
    
    func setImageEpisodeDetail (_ episode: Episode) {
        self.episodeImage.image = UIImage.init(named: episode.image ?? "")
    }
}
