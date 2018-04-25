import Foundation

class Stats:StatsProtocol {
    var board:BoardProtocol
    var presenter:StatsPresenterProtocol
    
    required init() {
        self.board = Board()
        self.presenter = StatsPresenter()
    }
    
    func reloadViewModel() {
        self.presenter.updateWith(board:self.board)
    }
}
