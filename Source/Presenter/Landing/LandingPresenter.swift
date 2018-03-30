import Foundation

class LandingPresenter:LandingPresenterProtocol {
    var outlets:LandingPresenterOutletsProtocol
    var collection:LandingPresenterCollectionProtocol
    var collectionMenuAnimation:LandingPresenterCollectionMenuAnimationProtocol
    
    init() {
        self.outlets = LandingPresenterOutlets()
        self.collection = LandingPresenterCollection()
        self.collectionMenuAnimation = LandingPresenterCollectionMenuAnimation()
    }
    
    func update(viewModel:LandingViewModel) {
        self.outlets.update(viewModel:viewModel.outlets)
        self.collection.update(viewModel:viewModel.collection)
    }
}
