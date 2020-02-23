//
//  EpisodeViewController.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 16/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, RateViewControllerDelegate, FavoriteDelegate {
   
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupNotifications()
    }
    
    func setupUI() {
        
        self.title = "Seasons"
        
        let nib = UINib.init(nibName: "EpisodeTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "EpisodeTableViewCell")
        
        self.tableView.delegate = self // Esto se puede hacer tb desde .xib
        self.tableView.dataSource = self
        
    }
    
    deinit {
        let noteName = Notification.Name.init(rawValue: "DidFavoriteUpdated")
        NotificationCenter.default.removeObserver(self, name: noteName, object: nil)
    }
    
    func setupNotifications() {
        let noteName = Notification.Name.init(rawValue: "DidFavoriteUpdated")
        NotificationCenter.default.addObserver(self, selector: #selector(self.didFavoriteChanged), name: noteName, object: nil)
    }
    
    var episodes: [Episode] = [Episode.init(id: 56, name: "Winter is Coming", date: "April 17, 2011", image: "episodeTest", episode: 1, season: 1, overview: "Jon Arryn, the Hand of the King, is dead. King Robert…")]
    
    // MARK: - RateViewControllerCellDelegate
    
    func didRateChanged() {
        self.tableView.reloadData()
    }
    
    // MARK: - DelegateViewControllerCellDelegate

    @objc func didFavoriteChanged() {
        self.tableView.reloadData()
       }
       
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 123
    }
    
//    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
//        return false
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let rateVC = RateViewController.init(withEpisode: episodes[indexPath.row])
//        rateVC.present(rateVC, animated: true, completion: nil)
//        self.modalTransitionStyle = .crossDissolve
//        self.modalPresentationStyle = .fullScreen
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    // MARK: UITableViewDatasource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeTableViewCell", for: indexPath) as? EpisodeTableViewCell {
            // El VC ya tiene la celda. Pero está vacía. Ahora toca cargarla antes de pasársela a la tabla. Lo hacemos con una función que creamos .setEpisode
            let ep = episodes[indexPath.row]
            cell.setEpisode(ep)
            cell.rateBlock = { () -> Void in
                let rateVC = RateViewController.init(withEpisode: ep)
                let navigationCont = UINavigationController.init(rootViewController: rateVC)
                self.navigationController?.present(navigationCont, animated: true, completion: nil)
                self.modalTransitionStyle = .crossDissolve
                self.modalPresentationStyle = .fullScreen
                
                rateVC.delegate = self
                
            }
            cell.delegate = self
            return cell
        }
        fatalError("Could not create Episode cell")
    }
    
    
    
    
    
    
    
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
