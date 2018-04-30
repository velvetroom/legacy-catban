import Foundation
@testable import catban

class MockStatsProtocol:StatsProtocol {
    var onReloadViewModel:(() -> Void)?
    var board:BoardProtocol
    var presenter:StatsPresenterProtocol
    var items:[StatsItemProtocol]
    
    required init() {
        self.board = Board()
        self.presenter = StatsPresenter()
        self.items = []
    }
    
    func reloadViewModel() {
        self.onReloadViewModel?()
    }
}
