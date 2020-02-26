
//
//  House.swift
//  GoTapp
//
//  Created by Ricardo González Pacheco on 19/02/2020.
//  Copyright © 2020 Ricardo González Pacheco. All rights reserved.
//

import Foundation

struct House{

    
    var name: String
    var words: String
    var shield: String
    var seat: String
    
}

extension House: Equatable {
    static func == (lhs: House, rhs: House) -> Bool {
        return
            lhs.name == rhs.name &&
            lhs.words == rhs.words &&
            lhs.shield == rhs.shield &&
            lhs.seat == rhs.seat
    }
}
