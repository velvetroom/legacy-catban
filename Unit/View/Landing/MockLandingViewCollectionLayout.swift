import Foundation
@testable import catban

class MockLandingViewCollectionLayout:LandingViewCollectionLayout {
    var onViewModelSet:(() -> Void)?
    
    override var viewModel:LandingViewModelCollectionLayout {
        didSet {
            self.onViewModelSet?()
        }
    }
}
