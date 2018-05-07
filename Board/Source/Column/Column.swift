import Foundation

class Column:ColumnProtocol, Equatable {
    var identifier:String
    var name:String
    var cards:[CardProtocol]
    var created:Int
    var countCards:Int {
        get {
            return self.cards.count
        }
    }
    
    init() {
        self.identifier = String()
        self.name = String()
        self.cards = []
        self.created = 0
    }
    
    static func == (lhs:Column, rhs:Column) -> Bool {
        return rhs.equals(model:lhs)
    }
}
