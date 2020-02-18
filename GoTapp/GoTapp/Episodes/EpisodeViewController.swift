//
//  EpisodeViewController.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 16/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    func setup() {
        
        self.title = "Seasons"
        
        let nib = UINib.init(nibName: "EpisodeTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "EpisodeTableViewCell")
    }
    
    var episodes: [Episode] = [Episode.init(id: 1, name: "Winter is Coming", date: "April 17, 2011", image: "episodeTest", episode: 1, season: 1, overview: "Jon Arryn, the Hand of the King, is dead. King Robert…")]
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    @IBAction func openRate(_ sender: Any) {
//        //Código para abrir pantalla Rate
//        let rateViewController = RateViewController()
//
//        //Para cambiar de transición en el present:
//        rateViewController.modalTransitionStyle = .crossDissolve
//        rateViewController.modalPresentationStyle = .fullScreen
//
//        self.present(rateViewController, animated: true, completion: nil)
//        //self.navigationController?.pushViewController(rateViewController, animated: true)
//
//
//    }
    
}
