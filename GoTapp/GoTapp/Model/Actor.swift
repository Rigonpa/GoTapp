//
//  Actor.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 17/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import UIKit


class Actor {
    var name: String
    var alias: String?
    var films: [String]
    var yearBirth: String
    var countryBirth: String?
    
    init(name: String, alias: String?, films: [String], yearBirth: String, countryBirth: String?) {
        self.name = name
        self.alias = alias
        self.films = films
        self.yearBirth = yearBirth
        self.countryBirth = countryBirth
    }
}

