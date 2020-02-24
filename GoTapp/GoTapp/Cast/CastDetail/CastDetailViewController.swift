//
//  CastDetailViewController.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 24/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class CastDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var cast: Cast?
    
    convenience init(_ cast: Cast?) {
        self.init(nibName:"CastDetailViewController", bundle: nil)
        self.cast = cast
        self.title = cast?.fullname
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
    }

    // MARK: - setupUI
    
    func setupUI() {
        
        let nib = UINib.init(nibName: "CastImageTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CastImageTableViewCell")
        
        let nib2 = UINib.init(nibName: "CastDataTableViewCell", bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: "CastDataTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row < 1 {
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: "CastImageTableViewCell", for: indexPath) as? CastImageTableViewCell {
                cell.setCastImage(self.cast)
                return cell
            }
            
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "CastDataTableViewCell", for: indexPath) as? CastDataTableViewCell {
                cell.setCastData(self.cast)
                return cell
            }
        }
        
        fatalError("Could not create Cast cell")
    }

}
