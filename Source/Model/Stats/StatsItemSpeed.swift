import Foundation

class StatsItemSpeed:StatsItemProtocol {
    func factoryViewModelWith(project:ProjectProtocol) -> StatsViewModelCollectionItemProtocol {
        var viewModel:StatsViewModelCollectionItemSpeed = StatsViewModelCollectionItemSpeed()
        return viewModel
    }
}
