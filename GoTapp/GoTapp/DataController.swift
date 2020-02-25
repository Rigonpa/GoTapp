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

//protocol Identifiable {
//    var id: Int { get }
//}

class DataController {
    
    static var shared = DataController()
    
    private init() {}
    
    // Por seguridad ponemos private
    private var rating: [Rating] = []
    private var favoriteCast: [Int] = []
    var favoriteEpisode: [Episode] = []
    
    // MARK: - Favorite Episodes
    
    func numberEpisodes() -> Int {
        return favoriteEpisode.count
    }
    
    func isFavorite(_ episode: Episode) -> Bool {
        return favoriteEpisode.contains {
            $0.id == episode.id
        }
    }
    
    func addFavorite(_ episode: Episode) {
        if self.isFavorite(episode) == false {
            favoriteEpisode.append(episode)
        }
    }
    
    func removeFavorite(_ episode: Episode) {
        if self.isFavorite(episode) {
            if let index = favoriteEpisode.firstIndex(where: {
                $0.id == episode.id
            }){
            favoriteEpisode.remove(at: index)
            }
        }
    }
    
    // MARK: - Favorite Cast
    
    func isFavorite(_ cast: Cast) -> Bool {
        return favoriteCast.contains(cast.id)
    }
    
    func addFavorite(_ cast: Cast) {
        if self.isFavorite(cast) == false {
            favoriteCast.append(cast.id)
        }
    }
    
    func removeFavorite(_ cast: Cast) {
        if self.isFavorite(cast) {
            if let index = favoriteCast.firstIndex(of: cast.id){
            favoriteCast.remove(at: index)
            }
        }
    }
    
    func cleanFavorite () {
        favoriteCast = []
        favoriteEpisode = []
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
    
    /* Genéricos
    
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
    */
    
    
}

