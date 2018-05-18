import Foundation
@testable import Home

class MockMapColumn:MapColumn {
    var onAppendItem:((MapItemProtocol) -> Void)?
    var onAddItem:((MapItemProtocol) -> Void)?
    
    override func append(item:MapItemProtocol) {
        self.onAppendItem?(item)
    }
    
    override func add(item:MapItemProtocol) {
        self.onAddItem?(item)
    }
}
