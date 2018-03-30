import Foundation

class LandingPresenter:LandingPresenterProtocol {
    var outlets:LandingPresenterOutletsProtocol
    var collection:LandingPresenterCollectionProtocol
    var collectionMenu:LandingPresenterCollectionMenuProtocol
    
    init() {
        self.outlets = LandingPresenterOutlets()
        self.collection = LandingPresenterCollection()
        self.collectionMenu = LandingPresenterCollectionMenu()
    }
    
    func update(viewModel:LandingViewModel) {
        self.outlets.update(viewModel:viewModel.outlets)
        self.collection.update(viewModel:viewModel.collection)
    }
}
