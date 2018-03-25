import Foundation
@testable import catban

class MockLandingCollectionDelegate:LandingCollectionDelegate {
    var onViewModelSet:(() -> Void)?
    
    override var viewModel:LandingViewModelCollection {
        didSet {
            self.onViewModelSet?()
        }
    }
}
