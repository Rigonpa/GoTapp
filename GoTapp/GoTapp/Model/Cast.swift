//
//  Cast.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 19/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import Foundation

struct Cast: Identifiable, Codable{

    var id: Int
    var avatar: String?
    var fullname: String?
    var role: String?
    var episodes: Int?
    var birth: String?
    var placeBirth: String?
}

extension Cast: Equatable {
    static func == (lhs: Cast, rhs: Cast) -> Bool {
        return
            lhs.id == rhs.id &&
            lhs.avatar == rhs.avatar &&
            lhs.fullname == rhs.fullname &&
            lhs.role == rhs.role &&
            lhs.episodes == rhs.episodes &&
            lhs.birth == rhs.birth &&
            lhs.placeBirth == rhs.placeBirth
    }
}
