//
//  DataController.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 19/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import Foundation

protocol FavoriteHouseDelegate: class{
    func didFavoriteHouseChanged()
}

protocol FavoriteCastDelegate: class {
    func didFavoriteCastChanged()
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
    private var favoriteEpisode: [Episode] = []
    private var favoriteHouse: [House] = []
    
    // MARK: - FAVORITE
    
    func cleanFavorite () {
        favoriteCast = []
        favoriteEpisode = []
        favoriteHouse = []
    }
    
    // MARK: - Favorite. 1 Episodes
    
    func takeFavoriteEpisode(_ index: Int) -> Episode {
        return favoriteEpisode[index]
    }
    
    func numberEpisodes() -> Int {
        return favoriteEpisode.count
    }
    
    func isFavoriteEpi(_ episode: Episode) -> Bool { // Wonderful Equatable protocol
        return favoriteEpisode.contains(episode)
    }
    
//    func isFavoriteEpi(_ episode: Episode) -> Bool { Without Equatable
//        return favoriteEpisode.contains {
//            $0.id == episode.id
//        }
//    }
    
    func addFavoriteEpi(_ episode: Episode) {
        if self.isFavoriteEpi(episode) == false {
            favoriteEpisode.append(episode)
        }
    }
    
    func removeFavoriteEpi(_ episode: Episode) { // Wonderful Equatable protocol
        if self.isFavoriteEpi(episode) {
            if let index = favoriteEpisode.firstIndex(of: episode){
            favoriteEpisode.remove(at: index)
            }
        }
    }
    
//    func removeFavoriteEpi(_ episode: Episode) { Without Equatable
//        if self.isFavoriteEpi(episode) {
//            if let index = favoriteEpisode.firstIndex(where: {
//                $0.id == episode.id
//            }){
//            favoriteEpisode.remove(at: index)
//            }
//        }
//    }
    
    // MARK: - Favorite. 2 Cast
    
    func isFavoriteCast(_ cast: Cast) -> Bool {
        return favoriteCast.contains(cast.id)
    }
    
    func addFavoriteCast(_ cast: Cast) {
        if self.isFavoriteCast(cast) == false {
            favoriteCast.append(cast.id)
        }
    }
    
    func removeFavoriteCast(_ cast: Cast) {
        if self.isFavoriteCast(cast) {
            if let index = favoriteCast.firstIndex(of: cast.id){
            favoriteCast.remove(at: index)
            }
        }
    }
    
    // MARK: - Favorite. 3 Houses
    
    func isFavoriteHouse(_ house: House) -> Bool {  // Equatable protocol
        return favoriteHouse.contains(house)
    }
    
    func addFavoriteHouse(_ house: House) {
        if self.isFavoriteHouse(house) == false {
            favoriteHouse.append(house)
        }
    }
    
    func removeFavoriteHouse(_ house: House) {  // Equatable protocol
        if self.isFavoriteHouse(house) {
            if let index = favoriteHouse.firstIndex(of: house){
            favoriteHouse.remove(at: index)
            }
        }
    }
    
    // MARK: - Rating
    
    func rateEpisode (_ episode: Episode, value value2: Double) {
        if self.ratingForEpisode(episode) == nil {
            let rateValue = Rating.init(id: episode.id, rate: .rated(value: value2))
            rating.append(rateValue)
        } else {
            //self.updateRate(episode: episode, value: value)
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
    
//    func ratingForEpisode (_ episode: Episode) -> Rating? {
//        let filtered = rating.filter {
//            $0.id == episode.id //$0 es rating
//        }
//        return filtered.first
//        //return (filtered.count == 0 ? nil : filtered.first
//    }
    
    
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

