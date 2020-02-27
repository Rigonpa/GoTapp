//
//  RateViewController.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 16/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit // Fundation y además todas las herramientas de diseño mobile

class RateViewController: UIViewController {
    
    //@IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var episodeImage: UIImageView!
    
    
    @IBOutlet weak var star01: UIImageView!
    @IBOutlet weak var star02: UIImageView!
    @IBOutlet weak var star03: UIImageView!
    @IBOutlet weak var star04: UIImageView!
    @IBOutlet weak var star05: UIImageView!
    @IBOutlet weak var rateSlider: UISlider!

    //El awakeFromNib sólo lo uso en las celdas.swift
//    override func awakeFromNib() {
//        episodeImage.layer.cornerRadius = 4.0
//        episodeImage.layer.borderWidth = 1.0
//        episodeImage.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
//
//    }
    
    private var episode: Episode?
    
    convenience init(withEpisode episode: Episode) {
        self.init()
        self.episode = episode
        self.title = episode.name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmButton.layer.cornerRadius = 4.0
        episodeImage.layer.cornerRadius = 4.0
        episodeImage.layer.borderWidth = 1.0
        episodeImage.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        //self.rateLabel.textColor = UIColor.red
        
        self.navigationItem.title = episode?.name
        
        episodeImage.image = UIImage.init(named: episode?.image ?? "")
    }
    
    
    // MARK: - IBActions
    
    @IBAction func sliderFire(_ sender: Any) {
        self.setRating(Double(rateSlider.value))
    }
    
    
    
    @IBAction func confirm(_ sender: Any) {
        //rateLabel.text = "Accept!"
        let rate = Double(rateSlider.value)
        if let episode = self.episode {
            DataController.shared.rateEpisode(episode, value: rate)
            self.navigationController?.dismiss(animated: true, completion: nil)
        }
        
        let notiName = Notification.Name.init("DidRateChanged")
        NotificationCenter.default.post(name: notiName, object: nil)
        
    }
    
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        //self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Rating
    
    func setRating (_ rating: Double) {
        
        //rateLabel.text = String(Int(rating * 5 / 10)) // No quiero que aparezca el número en pantalla
        
        
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






































