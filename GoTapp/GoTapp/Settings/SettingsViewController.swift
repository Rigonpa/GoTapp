//
//  SettingsViewController.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 16/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    @IBAction func cleanFavorite(_ sender: Any) {
        DataController.shared.cleanFavorite()
        // Actualizar todas las tablas donde aparezca icono fav
        let noteName = Notification.Name.init(rawValue: "DidFavoriteUpdated")
        NotificationCenter.default.post(name: noteName, object: nil)
    }
    
}
