import Foundation

class Stats:StatsProtocol {
    var board:BoardProtocol
    var presenter:StatsPresenterProtocol
    var items:[StatsItemProtocol]
    
    required init() {
        self.board = Board()
        self.presenter = StatsPresenter()
        self.items = Stats.factoryItems()
    }
    
    func reloadViewModel() {
        self.presenter.updateWith(board:self.board)
    }
}
