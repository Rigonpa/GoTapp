
import Foundation

enum Rate: Equatable {
    case unrated
    case rated(value: Double)
}

struct Rating{
    
    var id: Int
    var rate: Rate
    

}

extension Rating: Equatable {
    static func == (lhs: Rating, rhs: Rating) -> Bool {
        return
            lhs.id == rhs.id &&
            lhs.rate == rhs.rate
    }
    
    
}
