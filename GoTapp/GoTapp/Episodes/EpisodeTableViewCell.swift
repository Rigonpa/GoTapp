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
    
    @IBOutlet weak var star01: UIImageView!
    @IBOutlet weak var star02: UIImageView!
    @IBOutlet weak var star03: UIImageView!
    @IBOutlet weak var star04: UIImageView!
    @IBOutlet weak var star05: UIImageView!
    @IBOutlet weak var heart: UIButton!
    
    var rateBlock: (() -> Void)?
    var rateBlockFavEpi: (() -> Void)?
    
    private var episode: Episode?
    
    override func awakeFromNib() {
        thumb.layer.cornerRadius = 2.0
        thumb.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        thumb.layer.borderWidth = 1.0
        rateButton.layer.cornerRadius = 15
    }
    
    func setEpisode(_ episode: Episode){
        
        self.episode = episode
        
        let imageViewName = DataController.shared.isFavoriteEpi(episode) ? "heart.fill" : "heart"
        let imageView = UIImage.init(systemName: imageViewName)
        self.heart.setImage(imageView, for: .normal)
        
        
        thumb.image = UIImage.init(named: episode.image ?? "")
        title.text = episode.name
        date.text = episode.date
        
        if let op = DataController.shared.ratingForEpisode(episode) {
            switch op.rate {
            case .rated(let value):
                self.setRating(value)
            case .unrated:
                self.modeRate()
            }
        } else {
            self.modeRate()
        }
    }
    
    @IBAction func fireRate(_ sender: Any) {
        self.rateBlock?()
        self.rateBlockFavEpi?()
    }
    
    // MARK: - Favorite
    
    @IBAction func favoriteAction(_ sender: Any) {
        if let episode = self.episode {
            if DataController.shared.isFavoriteEpi(episode) {
                DataController.shared.removeFavoriteEpi(episode)
            } else {
                DataController.shared.addFavoriteEpi(episode)
            }
        }
        
        let notaName = Notification.Name.init("UpdateFavoriteEpisodes")
        NotificationCenter.default.post(name: notaName, object: nil)
        
    }
    
    
    // MARK: - Rating
    
    func modeStar() {
        rateButton.isHidden = true
        star01.isHidden = false
        star02.isHidden = false
        star03.isHidden = false
        star04.isHidden = false
        star05.isHidden = false
    }
    
    func modeRate() {
        rateButton.isHidden = false
        star01.isHidden = true
        star02.isHidden = true
        star03.isHidden = true
        star04.isHidden = true
        star05.isHidden = true
    }
    
    func setRating (_ rating: Double) {
        
        self.modeStar()
        
        
        self.setImageStar(star01, rating: rating, position: 0)
        self.setImageStar(star02, rating: rating, position: 1)
        self.setImageStar(star03, rating: rating, position: 2)
        self.setImageStar(star04, rating: rating, position: 3)
        self.setImageStar(star05, rating: rating, position: 4)
    }
    
    func setImageStar(_ imageView: UIImageView, rating: Double, position: Int){
        
        let positionDouble = Double(position)
        
        if rating >= positionDouble * 2 + 2 {
            
            imageView.image = UIImage.init(systemName: "star.fill")
            
        } else if rating <= positionDouble * 2 + 1 {
            
            imageView.image = UIImage.init(systemName: "star")
            
        } else {
            
            imageView.image = UIImage.init(systemName: "star.lefthalf.fill")
        }
    }
}
