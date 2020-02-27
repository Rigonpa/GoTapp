//
//  HouseDetailViewController.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 27/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class HouseDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var house: House?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()

    }
    
    convenience init(withHouse house: House) {
        self.init(nibName: "HouseDetailViewController", bundle: nil)
        self.house = house
        self.title = house.name
    }
    
    // MARK: - Setup UI

    func setupUI(){
        let nibImage = UINib.init(nibName: "HouseImageTableViewCell", bundle: nil)
        tableView.register(nibImage, forCellReuseIdentifier: "HouseImageTableViewCell")
        
        let nibData = UINib.init(nibName: "HouseDataTableViewCell", bundle: nil)
        tableView.register(nibData, forCellReuseIdentifier: "HouseDataTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row < 1 {
        return 400
        } else {
            return 346
        }
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
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
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: "HouseImageTableViewCell", for: indexPath) as? HouseImageTableViewCell {
                
                if let houseDetail = self.house {
                    cell.setHouseImage(houseDetail)
                    return cell
                }
            }
            
            fatalError("Not possible to create houseDetail cell")
            
        } else {
    
            if let cell = tableView.dequeueReusableCell(withIdentifier: "HouseDataTableViewCell", for: indexPath) as? HouseDataTableViewCell {
    
                if let houseDetail = self.house {
                    cell.setHouseData(houseDetail)
                    return cell
                }
            }
    
            fatalError("Not possible to create houseDetail cell")
        }
    
    }


}
