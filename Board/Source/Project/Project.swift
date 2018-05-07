import Foundation

class Project:ProjectProtocol {
    var identifier:String
    var created:Int
    var columns:[ColumnProtocol]
    var countColumns:Int {
        get {
            return self.columns.count
        }
    }
    
    init() {
        self.identifier = String()
        self.created = 0
        self.columns = []
    }
}
