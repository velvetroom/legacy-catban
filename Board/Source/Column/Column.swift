import Foundation

class Column:ColumnProtocol {
    var identifier:String
    var created:Int
    
    init() {
        self.identifier = String()
        self.created = 0
    }
}
