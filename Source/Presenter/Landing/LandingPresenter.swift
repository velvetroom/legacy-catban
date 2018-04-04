import Foundation

class LandingPresenter:LandingPresenterProtocol {
    var outlets:LandingPresenterOutletsProtocol
    var collection:LandingPresenterCollectionProtocol
    
    init() {
        self.outlets = LandingPresenterOutlets()
        self.collection = LandingPresenterCollection()
    }
    
    func update(viewModel:LandingViewModel) {
        self.collection.update(viewModel:viewModel.collection)
        self.outlets.update(viewModel:viewModel.outlets)
    }
    
    func updateCardAt(index:IndexPath) {
        self.outlets.list.viewCollection?.reloadItems(at:[index])
    }
}
