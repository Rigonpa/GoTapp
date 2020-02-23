//
//  Episode.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 16/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit

class Episode: Identifiable, Codable {
    var id: Int //Le obligo a que siempre tenga valor
    var name: String?
    var date: String?
    var image: String? //Ruta de la imagen - Podría haber algún capítulo que no tenga imagen
    var episode: Int
    var season: Int
    var overview: String
    
    init(id: Int, name: String?, date: String?, image: String?, episode: Int, season: Int, overview: String) {
        self.id = id
        self.name = name
        self.date = date
        self.image = image
        self.episode = episode
        self.season = season
        self.overview = overview
    }
}
