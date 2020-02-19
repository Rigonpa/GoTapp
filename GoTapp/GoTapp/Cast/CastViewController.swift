//
//  CastViewController.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 16/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class CastViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
    }

    func setupUI(){
        let nib = UINib.init(nibName: "CastTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CastTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    let cast: [Cast] = [Cast.init(id: 1, avatar: "Emilia Clarke", fullname: "Emilia Clarke", role: "Daenerys Targaryen", episodes: 73, birth: "1986-10-23", birthPlace: "Londos, England UK"), Cast.init(id: 2, avatar: "Kit Harington", fullname: "Kit Harington", role: "Jon Snow", episodes: 73, birth: "1986-12-26", birthPlace: "Worcester, Worcestershire, England UK")]

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
            return cell
            
        }
        fatalError("Could not create Cast cell")
    }

}
