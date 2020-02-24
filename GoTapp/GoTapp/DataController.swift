//
//  DataController.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 19/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import Foundation

protocol FavoriteDelegate: class {
    func didFavoriteChanged()
}

protocol Identifiable {
    var id: Int { get }
}

class DataController {
    
    static var shared = DataController()
    
    private init() {}
    
    // Por seguridad ponemos private
    private var rating: [Rating] = []
    private var favorite: [Int] = []
    
    // MARK: - Favorite
    
    func isFavorite<T: Identifiable>(_ value: T) -> Bool {
        return favorite.contains(value.id)
    }
    
    func addFavorite<T: Identifiable> (_ value: T) {
        if self.isFavorite(value) == false {
            favorite.append(value.id)
        }
    }
    
    func removeFavorite<T: Identifiable> (_ value: T) {
        if self.isFavorite(value) {
            if let index = favorite.firstIndex(of: value.id){
            favorite.remove(at: index)
            }
        }
    }
    
    func cleanFavorite () {
        favorite = []
    }
    
    // MARK: - Rating
    
    func rateEpisode (_ episode: Episode, value: Double) {
        if self.ratingForEpisode(episode) == nil {
            let rateValue = Rating.init(id: episode.id, rate: .rated(value: value))
            rating.append(rateValue)
        } else {
            self.updateRate(episode: episode, value: value)
        }
        
    }
    
    func removeRateEpisode (_ episode: Episode) {
        if let index = rating.firstIndex(where: {
            return $0.id == episode.id
        }) {
            rating.remove(at: index)
        }
    }
    
    /* Forma larga de función
    func ratingForEpisode (_ episode: Episode) -> Rating {
        let filtered = rating.filter { (rating) -> Bool in
            if rating.id == episode.id {
                return true
            } else {
                return false
            }
        }
        return filtered.first!
        //return (filtered.count == 0 ? nil : filtered.first
    }
     */
    
    func ratingForEpisode (_ episode: Episode) -> Rating? {
        let filtered = rating.filter {
            $0.id == episode.id //$0 es rating
        }
        return filtered.first
        //return (filtered.count == 0 ? nil : filtered.first
    }
    
    func updateRate (episode: Episode, value: Double) {
       let indexOfEpisode = rating.firstIndex{$0.id == episode.id}
          
          rating[indexOfEpisode!] = Rating.init(id: episode.id, rate: .rated(value: value))
    }
    
    
    
    
    
    
    
}

