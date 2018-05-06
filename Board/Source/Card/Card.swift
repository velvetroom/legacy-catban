import Foundation

class Card:CardProtocol {
    var identifier:String
    var created:Int
    
    init() {
        self.identifier = String()
        self.created = 0
    }
}
