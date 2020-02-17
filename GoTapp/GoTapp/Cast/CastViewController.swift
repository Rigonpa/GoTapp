//
//  CastViewController.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 16/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class CastViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func openIainGlen(_ sender: Any) {
    }
    @IBAction func openEmiliaClarke(_ sender: Any) {
        
        let emiliaClarkeVC = EmiliaClarkeViewController()
        //self.present(actorVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(emiliaClarkeVC, animated: true)
        emiliaClarkeVC.modalTransitionStyle = .crossDissolve
        emiliaClarkeVC.modalPresentationStyle = .fullScreen
        
    }
    @IBAction func openKitHarington(_ sender: Any) {
    }
    @IBAction func openConlethHill(_ sender: Any) {
    }
    @IBAction func openSophieTurner(_ sender: Any) {
    }
    @IBAction func openLenaHeadey(_ sender: Any) {
    }
    @IBAction func openPeterDinklage(_ sender: Any) {
    }
    @IBAction func openMaisieWilliams(_ sender: Any) {
    }
    @IBAction func openEJohnBradley(_ sender: Any) {
    }
    
}
