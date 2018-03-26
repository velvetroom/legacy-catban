import UIKit
@testable import catban

class MockLandingCollectionDelegate:LandingCollectionDelegate {
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
