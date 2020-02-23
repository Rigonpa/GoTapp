//
//  Cast.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 19/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import Foundation

struct Cast: Identifiable, Codable {
    
    var id: Int
    var avatar: String?
    var fullname: String?
    var role: String?
    var episodes: Int?
    var birth: String?
    var birthPlace: String?
}
