import Foundation

class Column:ColumnProtocol {
    var identifier:String
    var created:Int
    var cards:[CardProtocol]
    var countCards:Int {
        get {
            return self.cards.count
        }
    }
    
    init() {
        self.identifier = String()
        self.created = 0
        self.cards = []
    }
}
