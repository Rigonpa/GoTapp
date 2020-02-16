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
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmButton.layer.cornerRadius = 4.0
        //self.rateLabel.textColor = UIColor.red
    
    }
    
    @IBAction func confirm(_ sender: Any) {
        rateLabel.text = "Accept!"
        print("Accept!")
//        print("Aceptando!! \(sender)")
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
//
//    @IBAction func fire(_ sender: Any) {
//        print("Fire!! \(sender)")
//        self.rateLabel.text = "\(Int(slider.value))"
//    }
}
