import Foundation
@testable import Home

class MockMapProtocol:MapProtocol {
    var onAddColumn:((MapColumn) -> Void)?
    var onAddItem:((MapItemProtocol) -> Void)?
    var onUpdateContentSize:(() -> Void)?
    var onClear:(() -> Void)?
    var viewScroll:ViewScroll!
    
    func add(column:MapColumn) {
        self.onAddColumn?(column)
    }
    
    func add(item:MapItemProtocol) {
        self.onAddItem?(item)
    }
    
    func updateContentSize() {
        self.onUpdateContentSize?()
    }
    
    func clear() {
        self.onClear?()
    }
}
