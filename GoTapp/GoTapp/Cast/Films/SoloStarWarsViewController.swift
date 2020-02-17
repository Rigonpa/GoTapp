//
//  SoloStarWarsViewController.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 17/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class SoloStarWarsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func close(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        self.modalTransitionStyle = .coverVertical
        self.modalPresentationStyle = .fullScreen
    }
    
}
