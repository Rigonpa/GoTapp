//
//  EpisodeDataTableViewCell.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 24/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class EpisodeDataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var seasonEpisode: UILabel!
    @IBOutlet weak var nameEpisode: UILabel!
    @IBOutlet weak var dateShown: UILabel!
    @IBOutlet weak var overview: UITextView!

    override func awakeFromNib() {
        
    }
    
    func setDataEpisodeDetail(_ episode: Episode) {
        let s = episode.season
        let e = episode.episode
        seasonEpisode.text = "S\(String(s))E\(String(e))"
        nameEpisode.text = episode.name
        dateShown.text = episode.date
        overview.text = episode.overview
        
    }
}
