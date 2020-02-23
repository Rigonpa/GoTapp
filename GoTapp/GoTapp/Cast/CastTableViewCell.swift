//
//  CastTableViewCell.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 19/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class CastTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var role: UILabel!
    @IBOutlet weak var episodes: UILabel!
    @IBOutlet weak var heart: UIButton!
    
    private var cast: Cast?
    var delegate: FavoriteDelegate?
    
    override func awakeFromNib() {
        avatar.layer.cornerRadius = 8.0
        avatar.layer.borderWidth = 1.0
        avatar.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
    }
    
    func setCast(_ cast: Cast) {
        self.cast = cast
        
        let heartImageNamed = DataController.shared.isFavorite(cast) ? "heart.fill" : "heart"
        let heartImage = UIImage.init(systemName: heartImageNamed)
        self.heart.setImage(heartImage, for: .normal)
        
        self.avatar.image = UIImage.init(named: cast.avatar ?? "")
        self.name.text = cast.fullname
        self.role.text = cast.role
        self.episodes.text = "\(cast.episodes ?? 0) episodes"
        
    }
    
    // MARK: - IBActions
    
    @IBAction func favoriteAction(_ sender: Any) {
        if let cast = self.cast {
            if DataController.shared.isFavorite(cast) {
                DataController.shared.removeFavorite(cast)
            } else {
                DataController.shared.addFavorite(cast)
            }
            self.delegate?.didFavoriteChanged()
        }
    }
}
