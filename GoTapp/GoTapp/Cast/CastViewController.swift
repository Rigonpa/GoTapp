//
//  CastViewController.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 16/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class CastViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FavoriteDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
//    let cast: [Cast] = [Cast.init(id: 1, avatar: "Emilia Clarke", fullname: "Emilia Clarke", role: "Daenerys Targaryen", episodes: 73, birth: "1986-10-23", birthPlace: "Londos, England UK"), Cast.init(id: 2, avatar: "Kit Harington", fullname: "Kit Harington", role: "Jon Snow", episodes: 73, birth: "1986-12-26", birthPlace: "Worcester, Worcestershire, England UK")]

    var cast: [Cast] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupNotifications()
        self.setupData()
    }

    deinit {
        let noteName = Notification.Name.init(rawValue: "DidFavoriteUpdated")
        NotificationCenter.default.removeObserver(self, name: noteName, object: nil)
    }
    
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
    
    func setupNotifications() {
        let noteName = Notification.Name.init("DidFavoriteUpdated")
        NotificationCenter.default.addObserver(self, selector: #selector(self.didFavoriteChanged), name: noteName, object: nil)
    }
    
    func setupUI(){
           
           self.title = "Cast"
           let nib = UINib.init(nibName: "CastTableViewCell", bundle: nil)
           tableView.register(nib, forCellReuseIdentifier: "CastTableViewCell")
           
           tableView.delegate = self
           tableView.dataSource = self
           
       }
    
    
    
    // MARK: - CastTableViewCellDelegate
    
    @objc func didFavoriteChanged() {
        self.tableView.reloadData()
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 148
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("La celda ha sido pulsada en la sección \(indexPath.section) fila \(indexPath.row)")
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
            cell.delegate = self
            return cell
            
        }
        fatalError("Could not create Cast cell")
    }

}
