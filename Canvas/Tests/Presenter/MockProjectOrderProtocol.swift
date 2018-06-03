import Foundation
import Board

class MockProjectOrderProtocol:ProjectOrderProtocol {
    var onOrderWithOrder:(() -> Void)?
    
    func orderWith(order:Order) {
        self.onOrderWithOrder?()
    }
}
