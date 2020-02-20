//
//  HouseDetailViewController.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 19/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class HouseDetailViewController: UIViewController {

    @IBOutlet weak var shield: UIImageView!
    @IBOutlet weak var words: UITextView!
    @IBOutlet weak var seat: UITextView!
    var house: House?
    
    convenience init(house: House?) {
        self.init(nibName: "HouseDetailViewController", bundle: nil)
        self.title = house?.name
        self.house = house
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shield.image = UIImage.init(named: self.title!)
        //shield.image = UIImage.init(named: house?.name ?? "")
        words.text = house?.words
        seat.text = house?.seat     
        
    }


}
