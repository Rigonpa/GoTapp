//
//  FavoriteEpisodeViewController.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 25/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class FavoriteEpisodeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FavoriteDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var episodes: [Episode] = []
    
    convenience init(_ episodes: [Episode]) {
        self.init(nibName: "FavoriteEpisodeViewController", bundle: nil)
        self.episodes = episodes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()

    }
    
    // MARK: - SetupUI
    
    func setupUI() {
        let nib = UINib.init(nibName: "EpisodeTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "EpisodeTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    // MARK: - FavoriteDelegate
    
    func didFavoriteChanged() {
        tableView.reloadData()
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 123
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
            cell.setEpisode(DataController.shared.favoriteEpisode[indexPath.row])
            cell.delegate = self
            return cell
        }
        
        fatalError("Impossible to create Episode cell")
    }
    

}
