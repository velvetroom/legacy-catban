import Foundation
@testable import Board

class MockProjectManagedProtocol:ProjectManaged {
    var numberOfColumns:Int {
        get {
            return self.columns.count
        }
    }
    
    var lastColumn:ColumnProtocol? {
        get {
            return self.columns.last
        }
    }
}
