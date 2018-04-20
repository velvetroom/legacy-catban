import Foundation
@testable import catban

class MockOrganiseProtocol:OrganiseProtocol {
    var board:BoardProtocol
    
    init() {
        self.board = Board()
    }
}
