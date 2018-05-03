import Foundation
@testable import catban

class MockProjectColumn:ProjectColumn {
    var onDeleteCardAt:((Int) -> Void)?
    
    override func deleteCardAt(index:Int) {
        self.onDeleteCardAt?(index)
    }
}
