import Foundation
@testable import catban

class MockStatsProtocol:StatsProtocol {
    var board:BoardProtocol
    var presenter:StatsPresenterProtocol
    
    required init() {
        self.board = Board()
        self.presenter = StatsPresenter()
    }
}
