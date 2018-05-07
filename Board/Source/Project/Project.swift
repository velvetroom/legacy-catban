import Foundation

class Project:ProjectProtocol {
    var identifier:String
    var name:String
    var columns:[ColumnProtocol]
    var created:Int
    var countColumns:Int {
        get {
            return self.columns.count
        }
    }
    
    init() {
        self.identifier = String()
        self.name = String()
        self.columns = []
        self.created = 0
    }
}
