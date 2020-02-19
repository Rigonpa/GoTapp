//
//  StarkHouseDetailViewController.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 19/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class HouseDetailViewController: UIViewController {

    @IBOutlet weak var shield: UIImageView!
    
    convenience init(title: String?) {
        self.init(nibName: "HouseDetailViewController", bundle: nil)
        self.title = title
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shield.image = UIImage.init(named: self.title!)
    }


}
