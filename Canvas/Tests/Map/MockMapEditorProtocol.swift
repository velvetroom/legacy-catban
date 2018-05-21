import Foundation
import Board
@testable import Canvas

class MockMapEditorProtocol:MapEditorProtocol {
    var onAddColumns:(() -> Void)?
    var onOrder:(() -> Void)?
    var projectOrder:ProjectOrderProtocol!
    
    func add(columns:[MapColumnProtocol]) {
        self.onAddColumns?()
    }
    
    func order(item:MapItemProtocol) {
        self.onOrder?()
    }
}
