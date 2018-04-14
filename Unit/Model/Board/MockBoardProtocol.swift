import Foundation
@testable import catban

class MockBoardProtocol:BoardProtocol {
    var projects:[ProjectProtocol]
    
    init() {
        self.projects = []
    }
}
