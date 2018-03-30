import Foundation
@testable import catban

class MockLandingPresenter:LandingPresenterProtocol {
    var onUpdateViewModel:(() -> Void)?
    var outlets:LandingPresenterOutletsProtocol
    var collection:LandingPresenterCollectionProtocol
    var collectionMenu:LandingPresenterCollectionMenuProtocol
    
    init() {
        self.outlets = LandingPresenterOutlets()
        self.collection = LandingPresenterCollection()
        self.collectionMenu = LandingPresenterCollectionMenu()
    }
    
    func update(viewModel:LandingViewModel) {
        self.onUpdateViewModel?()
    }
}
