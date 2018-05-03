import Foundation

class StatsPresenter:StatsPresenterProtocol {
    var outlets:StatsPresenterOutlets
    var collection:StatsPresenterCollection
    var factory:StatsPresenterFactoryProtocol
    
    init() {
        self.outlets = StatsPresenterOutlets()
        self.collection = StatsPresenterCollection()
        self.factory = StatsPresenterFactory()
    }
    
    func updateWith(board:BoardProtocol, for items:[StatsItemProtocol]) {
        let viewModel:StatsViewModel = self.factory.factoryWith(board:board, for:items)
        self.updatePageControl(viewModel:viewModel.pageControl)
        self.updateCollection(viewModel:viewModel.collection)
    }
    
    private func updatePageControl(viewModel:StatsViewModelPageControl) {
        self.outlets.pageControl?.numberOfPages = viewModel.numberOFPages
    }
    
    private func updateCollection(viewModel:StatsViewModelCollection) {
        self.collection.datasource.viewModel = viewModel
    }
}
