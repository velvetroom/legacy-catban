import Foundation
@testable import catban

class MockLandingPresenterOutlets:LandingPresenterOutletsProtocol {
    var onUpdateViewModel:(() -> Void)?
    var list:LandingPresenterOutletsList
    
    init() {
        self.list = LandingPresenterOutletsList()
    }
    
    func update(viewModel:LandingViewModelOutlets) {
        self.onUpdateViewModel?()
    }
}
