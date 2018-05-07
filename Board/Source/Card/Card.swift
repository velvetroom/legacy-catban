import Foundation

class Card:CardProtocol, Equatable {
    var identifier:String
    var content:String
    var created:Int
    
    init() {
        self.identifier = String()
        self.content = String()
        self.created = 0
    }
    
    static func == (lhs:Card, rhs:Card) -> Bool {
        return rhs.equals(model:lhs)
    }
}
