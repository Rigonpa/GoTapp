//
//  FavoriteEpisodeViewController.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 25/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class FavoriteEpisodeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FavoriteEpisodeDelegate, TestRateViewControllerDelegate{

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupNotifications()

    }
    
    // MARK: - setupNotifications
    
    func setupNotifications() {
        let noti = Notification.Name.init("DidRateChanged")
        NotificationCenter.default.addObserver(self, selector: #selector(self.didEpiRateChanged), name: noti, object: nil)
    }
    
    // MARK: - setupUI
    
    func setupUI() {
        let nib = UINib.init(nibName: "EpisodeTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "EpisodeTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    // MARK: - Notification Center - Update Rating
    
    @objc func didEpiRateChanged() {
        self.tableView.reloadData()
    }
    
    // MARK: - FavoriteEpisodeDelegate
    
    func didFavEpiChanged() {
        self.tableView.reloadData()
    }
    
    // MARK: - TestRateViewControllerDelegate
    
    func testDidRateChanged() {
        self.tableView.reloadData()
    }
        
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 123
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let episodeDetail = EpisodeDetailViewController.init(episode: DataController.shared.favoriteEpisode[indexPath.row])
        self.navigationController?.pushViewController(episodeDetail, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return DataController.shared.favoriteEpisode.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeTableViewCell", for: indexPath) as? EpisodeTableViewCell {
            let epi = DataController.shared.favoriteEpisode[indexPath.row]
            cell.setEpisode(epi)
            cell.rateBlockFavEpi = {() -> Void in
                let rateVC = RateViewController.init(withEpisode: epi)
                let navigationCont = UINavigationController.init(rootViewController: rateVC)
                self.navigationController?.present(navigationCont, animated: true, completion: nil)
                self.modalTransitionStyle = .crossDissolve
                self.modalPresentationStyle = .fullScreen
                
                rateVC.testDelegate = self
            }
            cell.favEpiDelegate = self
            return cell
        }
        
        fatalError("Impossible to create Episode cell")
    }
    

}
