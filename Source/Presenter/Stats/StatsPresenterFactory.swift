import Foundation

class StatsPresenterFactory:StatsPresenterFactoryProtocol {
    func factoryWith(board:BoardProtocol) -> StatsViewModel {
        var viewModel:StatsViewModel = StatsViewModel()
        return viewModel
    }
}
