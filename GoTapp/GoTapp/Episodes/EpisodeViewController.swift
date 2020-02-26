//
//  EpisodeViewController.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 16/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
        
    @IBOutlet weak var tableView: UITableView!
    
//    var episodes: [Episode] = [Episode.init(id: 56, name: "Winter is Coming", date: "April 17, 2011", image: "episodeTest", episode: 1, season: 1, overview: "Jon Arryn, the Hand of the King, is dead. King Robert…")]
    var episodes: [Episode] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupNotifications()
        self.setupData(1)
    }
    
    // MARK: - DEINIT Notification Center
    
    deinit {
        
        let notaName = Notification.Name.init("UpdateFavoriteEpisodes")
        NotificationCenter.default.removeObserver(self, name: notaName, object: nil)
        
        let notiName = Notification.Name.init("DidRateChanged")
        NotificationCenter.default.removeObserver(self, name: notiName, object: nil)
        
        let noteName = Notification.Name.init(rawValue: "CleanFavorites")
        NotificationCenter.default.removeObserver(self, name: noteName, object: nil)
        
    }
    
    func setupData(_ seasonNumber: Int) {
        if let pathURL = Bundle.main.url(forResource: "season_\(seasonNumber)", withExtension: "json") {
            do {
        let data = try Data.init(contentsOf: pathURL) // Este try con exclamación está obligando a que haga la operación si o si - Ahora ya no hay exclamación
        let decoder = JSONDecoder()
        episodes = try decoder.decode([Episode].self, from: data)
        self.tableView.reloadData()
            } catch {
                fatalError(error.localizedDescription)
            }
        } else {
            fatalError("Could not build de path url")
        }
    }
    
    func setupUI() {
        
        self.title = "Seasons"
        
        let nib = UINib.init(nibName: "EpisodeTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "EpisodeTableViewCell")
        
        self.tableView.delegate = self // Esto se puede hacer tb desde .xib
        self.tableView.dataSource = self
        
    }
    
    func setupNotifications() {
        
        //Update FavoriteEpisodes
        let notaName = Notification.Name.init("UpdateFavoriteEpisodes")
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateFavoriteEpisodes), name: notaName, object: nil)
        
        //Update rating
        let notiName = Notification.Name(rawValue: "DidRateChanged")
        NotificationCenter.default.addObserver(self, selector: #selector(self.didEpiRateChanged), name: notiName, object: nil)
        
        // Clean Favorites
        let noteName = Notification.Name.init(rawValue: "CleanFavorites")
        NotificationCenter.default.addObserver(self, selector: #selector(self.cleanFavorites), name: noteName, object: nil)
    }
    
    // MARK: - IBActions
    
    @IBAction func seasonChanged(_ sender: UISegmentedControl) {
        let seasonNumber = sender.selectedSegmentIndex + 1
        self.setupData(seasonNumber)
    }
    
    // MARK: - Notification Center - Update Favorite Episodes
    
    @objc func updateFavoriteEpisodes(){
        self.tableView.reloadData()
    }
    
    // MARK: - Notification Center - Update Rating
    
    @objc func didEpiRateChanged() {
        self.tableView.reloadData()
    }

    // MARK: - Notification Center - Clean Favorites
    
    @objc func cleanFavorites() {
        self.tableView.reloadData()
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 123
    }
    
//    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let episodeDetailVC = EpisodeDetailViewController.init(episode: episodes[indexPath.row])
        self.navigationController?.pushViewController(episodeDetailVC, animated: true)
        
        
        
//        let rateVC = RateViewController.init(withEpisode: episodes[indexPath.row])
//        self.present(rateVC, animated: true, completion: nil)
//        self.modalTransitionStyle = .crossDissolve
//        self.modalPresentationStyle = .fullScreen
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    // MARK: UITableViewDatasource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeTableViewCell", for: indexPath) as? EpisodeTableViewCell {
            // El VC ya tiene la celda. Pero está vacía. Ahora toca cargarla antes de pasársela a la tabla. Lo hacemos con una función que creamos .setEpisode
            let ep = episodes[indexPath.row]
            cell.setEpisode(ep)
            cell.rateBlock = { () -> Void in
                
                let rateVC = RateViewController.init(withEpisode: ep)
                rateVC.modalPresentationStyle = .fullScreen
                let navi = UINavigationController.init(rootViewController: rateVC)
                self.present(navi, animated: true, completion: nil)

            }
            return cell
        }
        fatalError("Could not create Episode cell")
    }
    
    
    
    
    
    
    
//    @IBAction func openRate(_ sender: Any) {
//        //Código para abrir pantalla Rate
//        let rateViewController = RateViewController()
//
//        //Para cambiar de transición en el present:
//        rateViewController.modalTransitionStyle = .crossDissolve
//        rateViewController.modalPresentationStyle = .fullScreen
//
//        self.present(rateViewController, animated: true, completion: nil)
//        //self.navigationController?.pushViewController(rateViewController, animated: true)
//
//
//    }
    
}
