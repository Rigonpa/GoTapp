
import Foundation

enum Rate {
    case unrated
    case rated(value: Double)
}

struct Rating {
    var id: Int
    var rate: Rate
}
