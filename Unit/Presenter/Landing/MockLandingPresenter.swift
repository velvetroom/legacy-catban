import Foundation
@testable import catban

class MockLandingPresenter:LandingPresenterProtocol {
    var onUpdateViewModel:(() -> Void)?
    var outlets:LandingPresenterOutletsProtocol
    var collection:LandingPresenterCollectionProtocol
    
    init() {
        self.outlets = LandingPresenterOutlets()
        self.collection = LandingPresenterCollection()
    }
    
    func update(viewModel:LandingViewModel) {
        self.onUpdateViewModel?()
    }
}
