//
//  RateViewController.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 16/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit // Fundation y además todas las herramientas de diseño mobile

class RateViewController: UIViewController {
    
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var slider: UISlider!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.rateLabel.textColor = UIColor.red
    }
    
    @IBAction func accept(_ sender: Any) {
//        print("Aceptando!! \(sender)")
    }
    
    @IBAction func fire(_ sender: Any) {
//        print("Fire!! \(sender)")
        
        self.rateLabel.text = "\(Int(slider.value))"
    }
    
}
