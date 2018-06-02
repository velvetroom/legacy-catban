import Foundation

class Column:ColumnProtocol, Equatable {
    weak var container:ContainerProtocol?
    var identifier:String
    var name:String
    var cards:[CardProtocol]
    var created:Int
    
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
