import UIKit
@testable import catban

class MockLandingPresenterCollection:LandingPresenterCollection {
    var onViewModelSet:(() -> Void)?
    
    override init() {
        super.init()
    }
    
    override var viewModel:LandingViewModelCollection {
        didSet {
            self.onViewModelSet?()
        }
    }
}
