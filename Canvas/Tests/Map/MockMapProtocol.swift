import Foundation
import Board
@testable import Canvas

class MockMapProtocol:MapProtocol {
    var onAddColumns:(() -> Void)?
    var onArrange:(() -> Void)?
    var mapDelegate:MapDelegateProtocol!
    var projectOrder:ProjectOrderProtocol!
    
    func add(columns:[MapColumnProtocol]) {
        self.onAddColumns?()
    }
    
    func arrange(item:MapItemProtocol) {
        self.onArrange?()
    }
}
