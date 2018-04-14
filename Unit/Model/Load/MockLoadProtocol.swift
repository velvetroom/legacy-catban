import Foundation
@testable import catban

class MockLoadProtocol:LoadProtocol {
    var board:BoardProtocol
    
    init() {
        self.board = Board()
    }
}
