import Foundation
import Board
@testable import Canvas

class MockMapProtocol:MapProtocol {
    var onAddColumns:(() -> Void)?
    var onOrder:(() -> Void)?
    var mapDelegate:MapDelegateProtocol!
    var projectOrder:ProjectOrderProtocol!
    
    func add(columns:[MapColumnProtocol]) {
        self.onAddColumns?()
    }
    
    func order(item:MapItemProtocol) {
        self.onOrder?()
    }
}
