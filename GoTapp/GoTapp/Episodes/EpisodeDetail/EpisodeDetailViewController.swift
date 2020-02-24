//
//  EpisodeDetailViewController.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 24/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var episode: Episode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    convenience init(episode: Episode?) {
        self.init(nibName: "EpisodeDetailViewController", bundle: nil)
        self.title = episode?.name
        self.episode = episode
    }
    
    // MARK: - setupUI

    func setupUI() {
        let nib = UINib.init(nibName: "EpisodeImageTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "EpisodeImageTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 254
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeImageTableViewCell", for: indexPath) as? EpisodeImageTableViewCell {
            cell.setImageEpisodeDetail(episode!) // Preguntar a Fernando
           return cell
        }
        fatalError("Could not build the episode detail cell")
    }
    
    
}
