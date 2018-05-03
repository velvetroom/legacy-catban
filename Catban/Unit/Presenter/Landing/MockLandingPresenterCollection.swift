import Foundation
@testable import catban

class MockLandingPresenterCollection:LandingPresenterCollection {
    var onUpdateViewModel:(() -> Void)?
    
    override func update(viewModel:LandingViewModelCollection) {
        super.update(viewModel:viewModel)
        self.onUpdateViewModel?()
    }
}
