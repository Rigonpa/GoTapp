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
        
        let iainGlenVC = IainGlenViewController()
        //self.present(actorVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(iainGlenVC, animated: true)
        iainGlenVC.modalTransitionStyle = .crossDissolve
        iainGlenVC.modalPresentationStyle = .fullScreen
    }
    @IBAction func openEmiliaClarke(_ sender: Any) {
        
        let emiliaClarkeVC = EmiliaClarkeViewController()
        //self.present(actorVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(emiliaClarkeVC, animated: true)
        emiliaClarkeVC.modalTransitionStyle = .crossDissolve
        emiliaClarkeVC.modalPresentationStyle = .fullScreen
        
    }
    @IBAction func openKitHarington(_ sender: Any) {
        
        let kitHaringtonVC = KitHaringtonViewController()
            //self.present(actorVC, animated: true, completion: nil)
            self.navigationController?.pushViewController(kitHaringtonVC, animated: true)
            kitHaringtonVC.modalTransitionStyle = .crossDissolve
            kitHaringtonVC.modalPresentationStyle = .fullScreen
        
    }
    @IBAction func openConlethHill(_ sender: Any) {
    }
    @IBAction func openSophieTurner(_ sender: Any) {
        
        let sophieTurnerVC = SophieTurnerViewController()
        //self.present(actorVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(sophieTurnerVC, animated: true)
        sophieTurnerVC.modalTransitionStyle = .crossDissolve
        sophieTurnerVC.modalPresentationStyle = .fullScreen
    }
    @IBAction func openLenaHeadey(_ sender: Any) {
        
        let lenaHeadeyVC = LenaHeadeyViewController()
        //self.present(actorVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(lenaHeadeyVC, animated: true)
        lenaHeadeyVC.modalTransitionStyle = .crossDissolve
        lenaHeadeyVC.modalPresentationStyle = .fullScreen
    }
    @IBAction func openPeterDinklage(_ sender: Any) {
        
        let peterDinklageVC = PeterDinklageViewController()
        //self.present(actorVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(peterDinklageVC, animated: true)
        peterDinklageVC.modalTransitionStyle = .crossDissolve
        peterDinklageVC.modalPresentationStyle = .fullScreen
    }
    @IBAction func openMaisieWilliams(_ sender: Any) {
    }
    @IBAction func openEJohnBradley(_ sender: Any) {
    }
    
}
