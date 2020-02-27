//
//  CastViewController.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 16/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class CastViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FavoriteCastDelegate {

    
    @IBOutlet weak var tableView: UITableView!

    var cast: [Cast] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupNotifications()
        self.setupData()
    }
    
    // MARK: - DEINIT - Notification Center

    deinit {
        let noteName = Notification.Name.init(rawValue: "CleanFavorites")
        NotificationCenter.default.removeObserver(self, name: noteName, object: nil)
    }
    
    // MARK: - Setup Data
    
    func setupData() {
        
        if let pathURL = Bundle.main.url(forResource: "cast", withExtension: "json") {
            do {
                let data = try Data.init(contentsOf: pathURL)
                let decoder = JSONDecoder()
                cast = try decoder.decode([Cast].self, from: data)
                self.tableView.reloadData()
            } catch {
                fatalError(error.localizedDescription)
            }
        } else {
            fatalError("Could not build path url")
        }
    }
    
    // MARK: - Setup Notifications
    
    func setupNotifications() {
        let noteName = Notification.Name.init("CleanFavorites")
        NotificationCenter.default.addObserver(self, selector: #selector(self.cleanFavorites), name: noteName, object: nil)
    }
    
    // MARK: Setup UI
    
    func setupUI(){
           
           self.title = "Cast"
           let nib = UINib.init(nibName: "CastTableViewCell", bundle: nil)
           tableView.register(nib, forCellReuseIdentifier: "CastTableViewCell")
           
           tableView.delegate = self
           tableView.dataSource = self
           
       }
    
    // MARK: - FavoriteCastDelegate
    
    func didFavoriteCastChanged() {
        self.tableView.reloadData()
    }
    
    // MARK: - Notification Center - Clean Favorites
    
    @objc func cleanFavorites() {
        self.tableView.reloadData()
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 148
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let castDetailVC = CastDetailViewController.init(cast[indexPath.row])
        self.navigationController?.pushViewController(castDetailVC, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CastTableViewCell", for: indexPath) as? CastTableViewCell{
            
            let actor = cast[indexPath.row]
            cell.setCast(actor)
            cell.castDelegate = self
            return cell
            
        }
        fatalError("Could not create Cast cell")
    }

}
