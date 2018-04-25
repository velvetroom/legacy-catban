import Foundation
@testable import catban

class MockStatsPresenterFactoryProtocol:StatsPresenterFactoryProtocol {
    var onFactoryWithBoard:((BoardProtocol, [StatsItemProtocol]) -> Void)?
    var viewModel:StatsViewModel
    
    init() {
        self.viewModel = StatsViewModel()
    }
    
    func factoryWith(board:BoardProtocol, for items:[StatsItemProtocol]) -> StatsViewModel {
        self.onFactoryWithBoard?(board, items)
        return self.viewModel
    }
}
