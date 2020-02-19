//
//  HouseViewController.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 16/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()

    }

    func setupUI() {
        let nib = UINib.init(nibName: "HouseTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "HouseTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    var houses: [House] = [House.init(name: "Stark", words: "Winter is Coming", shield: "Stark", seat: "Winterfell"),
                           House.init(name: "Arryn", words: "as High as Honor", shield: "Arryn", seat: "The Eyrie"),
                           House.init(name: "Baratheon", words: "Ours is the Fury", shield: "Baratheon", seat: "Storm's End"),
                           House.init(name: "Greyjoy", words: "We Do Not Sow", shield: "Greyjoy", seat: "Salt Throne, Pyke"),
                           House.init(name: "Lannister", words: "Hear Me Roar!", shield: "Lannister", seat: "Casterly Rock"),
                           House.init(name: "Martell", words: "Unbowed, Unbent, Unbroken", shield: "Martell", seat: "Sunspear"),
                           House.init(name: "Targaryen", words: "Fire and Blood", shield: "Targaryen", seat: "Red Keep, King's Landing"),
                           House.init(name: "Tully", words: "Family, Duty, Honor", shield: "Tully", seat: "Riverrun"),
                           House.init(name: "Tyrell", words: "Growing Strong", shield: "Tyrell", seat: "Highgarden"),
                           ]
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 177
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = houses[indexPath.row].name
        let houseDetailVC = HouseDetailViewController.init(title: name)
        self.navigationController?.pushViewController(houseDetailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HouseTableViewCell", for: indexPath) as? HouseTableViewCell {
            
            let houseSelected = houses[indexPath.row]
            cell.setHouse(houseSelected)            
            return cell
        }
        fatalError("Could not create House cell")
    }

}
