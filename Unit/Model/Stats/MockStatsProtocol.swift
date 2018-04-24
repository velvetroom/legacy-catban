import Foundation
@testable import catban

class MockStatsProtocol:StatsProtocol {
    var board:BoardProtocol
    
    required init() {
        self.board = Board()
    }
}
