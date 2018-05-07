import Foundation

class Card:CardProtocol {
    var identifier:String
    var content:String
    var created:Int
    
    init() {
        self.identifier = String()
        self.content = String()
        self.created = 0
    }
}
