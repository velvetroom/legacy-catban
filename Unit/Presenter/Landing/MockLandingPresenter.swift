import Foundation
@testable import catban

class MockLandingPresenter:LandingPresenterProtocol {
    var onUpdateViewModel:(() -> Void)?
    var outlets:LandingPresenterOutletsProtocol
    var collection:LandingPresenterCollectionProtocol
    var collectionMenuAnimation:LandingPresenterCollectionMenuAnimationProtocol
    
    init() {
        self.outlets = LandingPresenterOutlets()
        self.collection = LandingPresenterCollection()
        self.collectionMenuAnimation = LandingPresenterCollectionMenuAnimation()
    }
    
    func update(viewModel:LandingViewModel) {
        self.onUpdateViewModel?()
    }
}
