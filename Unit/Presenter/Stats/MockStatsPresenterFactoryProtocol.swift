import Foundation
@testable import catban

class MockStatsPresenterFactoryProtocol:StatsPresenterFactoryProtocol {
    var onFactoryWithBoard:((BoardProtocol) -> Void)?
    var viewModel:StatsViewModel
    
    init() {
        self.viewModel = StatsViewModel()
    }
    
    func factoryWith(board:BoardProtocol) -> StatsViewModel {
        self.onFactoryWithBoard?(board)
        return self.viewModel
    }
}
