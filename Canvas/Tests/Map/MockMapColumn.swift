import Foundation
@testable import Canvas

class MockMapColumn:MapColumn {
    var onAppendItem:(() -> Void)?
    var onAddItem:(() -> Void)?
    
    override func add(item:MapItemProtocol) {
        self.onAppendItem?()
    }
    
    override func order(item:MapItemProtocol) {
        self.onAddItem?()
    }
}
