import Foundation

class StatsPresenterFactory:StatsPresenterFactoryProtocol {
    func factoryWith(board:BoardProtocol, for items:[StatsItemProtocol]) -> StatsViewModel {
        var viewModel:StatsViewModel = StatsViewModel()
        viewModel.pageControl = self.factoryPageControlWith(items:items)
        viewModel.collection = self.factoryCollectionWith(project:board.project, for:items)
        return viewModel
    }
    
    private func factoryPageControlWith(items:[StatsItemProtocol]) -> StatsViewModelPageControl {
        var viewModel:StatsViewModelPageControl = StatsViewModelPageControl()
        viewModel.numberOFPages = items.count
        return viewModel
    }
    
    private func factoryCollectionWith(project:ProjectProtocol,
                                       for items:[StatsItemProtocol]) -> StatsViewModelCollection {
        var viewModel:StatsViewModelCollection = StatsViewModelCollection()
        for item:StatsItemProtocol in items {
            let viewModelItem:StatsViewModelCollectionItemProtocol = item.factoryViewModelWith(
                project:project)
            viewModel.items.append(viewModelItem)
        }
        return viewModel
    }
}
