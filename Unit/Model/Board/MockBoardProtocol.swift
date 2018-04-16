import Foundation
@testable import catban

class MockBoardProtocol:BoardProtocol {
    var user:UserProtocol
    var projects:[ProjectProtocol]
    
    init() {
        self.user = User()
        self.projects = []
    }
}
