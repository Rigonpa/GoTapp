//
//  FavoriteEpisodeViewController.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 25/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class FavoriteEpisodeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupNotifications()

    }
    
    // MARK: DEINIT - Notification Center
    
    deinit {
        
        let notaName = Notification.Name.init("UpdateFavoriteEpisodes")
        NotificationCenter.default.removeObserver(self, name: notaName, object: nil)
        
        let notiName = Notification.Name.init("DidRateChanged")
        NotificationCenter.default.removeObserver(self, name: notiName, object: nil)
        
        let noteName = Notification.Name.init("CleanFavorites")
        NotificationCenter.default.removeObserver(self, name: noteName, object: nil)
        
    }
    
    // MARK: - setup Notifications
    
    func setupNotifications() {
        
        //Update Favorite Episodes
        let notaName = Notification.Name.init("UpdateFavoriteEpisodes")
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateFavoriteEpisodes), name: notaName, object: nil)
        
        // Update Rating
        let notiName = Notification.Name.init("DidRateChanged")
        NotificationCenter.default.addObserver(self, selector: #selector(self.didEpiRateChanged), name: notiName, object: nil)
        
        // Clean Favorites
        let noteName = Notification.Name.init("CleanFavorites")
        NotificationCenter.default.addObserver(self, selector: #selector(self.cleanFavorites), name: noteName, object: nil)
    }
    
    // MARK: - setup UI
    
    func setupUI() {
        
        self.title = "Favorite Episodes"
        let nib = UINib.init(nibName: "EpisodeTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "EpisodeTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    // MARK: - Notification Center - Update Favorite Episodes
    
    @objc func updateFavoriteEpisodes(){
        self.tableView.reloadData()
    }
    
    // MARK: - Notification Center - Update Rating
    
    @objc func didEpiRateChanged() {
        self.tableView.reloadData()
    }
    
    // MARK: - Notification Center - Clean Favorites
    
    @objc func cleanFavorites() {
        self.tableView.reloadData()
    }

    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 123
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let episodeDetail = EpisodeDetailViewController.init(episode: DataController.shared.takeFavoriteEpisode(indexPath.row))
        self.navigationController?.pushViewController(episodeDetail, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return DataController.shared.numberEpisodes()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeTableViewCell", for: indexPath) as? EpisodeTableViewCell {
            let epi = DataController.shared.takeFavoriteEpisode(indexPath.row)
            cell.setEpisode(epi)
            cell.rateBlockFavEpi = {() -> Void in
                let rateVC = RateViewController.init(withEpisode: epi)
                let navigationCont = UINavigationController.init(rootViewController: rateVC)
                self.navigationController?.present(navigationCont, animated: true, completion: nil)
                self.modalTransitionStyle = .crossDissolve
                self.modalPresentationStyle = .fullScreen
                

            }
            return cell
        }
        
        fatalError("Impossible to create Episode cell")
    }
    

}
