import Foundation

class Project:ProjectProtocol {
    var columns:[ProjectColumn]
    var name:String
    var identifier:String
    var totalCards:Int {
        get {
            var counter:Int = 0
            for column:ProjectColumn in self.columns {
                counter += column.cards.count
            }
            return counter
        }
    }
    
    init() {
        self.columns = []
        self.name = String()
        self.identifier = String()
    }
}
