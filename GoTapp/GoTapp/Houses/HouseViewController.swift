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
    
    var houses: [House] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupData()
    }

    // MARK: - Setup Data
    
    func setupData(){
        
        if let pathURL = Bundle.main.url(forResource: "houses", withExtension: "json"){
            
            do{
                let data = try Data.init(contentsOf: pathURL)
                
                do{
                    let decoder = JSONDecoder()
                    houses = try decoder.decode([House].self, from: data)
                    tableView.reloadData()
                    
                } catch {
                    fatalError("Failed to storage data in array of specific type")
                }
                
            } catch {
                fatalError("Failed to read url specified")
            }
            
            
        } else {
            fatalError("Not possible to find the resource with that extension")
        }
        
        
    }
    
    // MARK: - Setup UI
    
    func setupUI() {
        
        self.title = "Houses"
        let nib = UINib.init(nibName: "HouseTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "HouseTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }

   
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 177
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let name = houses[indexPath.row].name
        let houseDetailVC = HouseDetailViewController.init(withHouse: houses[indexPath.row])
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
