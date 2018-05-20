import Foundation
@testable import Canvas

class MockMapEditorProtocol:MapEditorProtocol {
    var onAddColumns:(() -> Void)?
    var onOrder:(() -> Void)?
    
    func add(columns:[MapColumnProtocol]) {
        self.onAddColumns?()
    }
    
    func order(item:MapItemProtocol) {
        self.onOrder?()
    }
}
