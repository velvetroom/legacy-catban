import Foundation

class Stats:StatsProtocol {
    var board:BoardProtocol
    var presenter:StatsPresenterProtocol
    
    required init() {
        self.board = Board()
        self.presenter = StatsPresenter()
    }
}
