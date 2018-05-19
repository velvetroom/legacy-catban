import Foundation
@testable import Canvas

class MockMapColumn:MapColumn {
    var onAppendItem:(() -> Void)?
    var onAddItem:(() -> Void)?
    
    override func append(item:MapItemProtocol) {
        self.onAppendItem?()
    }
    
    override func add(item:MapItemProtocol) {
        self.onAddItem?()
    }
}
