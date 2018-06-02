import Foundation
@testable import Canvas

class MockMapColumn:MapColumn {
    var onAddItem:(() -> Void)?
    var onOrderItem:(() -> Void)?
    
    override func add(item:MapItemProtocol) {
        self.onAddItem?()
    }
    
    override func arrange(item:MapItemProtocol) {
        self.onOrderItem?()
    }
}
