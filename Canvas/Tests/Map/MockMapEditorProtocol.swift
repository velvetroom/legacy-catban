import Foundation
import Board
@testable import Canvas

class MockMapEditorProtocol:MapEditorProtocol {
    var onAddColumns:(() -> Void)?
    var onArrange:(() -> Void)?
    var projectOrder:ProjectOrderProtocol!
    
    func add(columns:[MapColumnProtocol]) {
        self.onAddColumns?()
    }
    
    func arrange(item:MapItemProtocol) {
        self.onArrange?()
    }
}
