import Foundation
@testable import catban

class MockLandingViewCollectionLayout:LandingViewCollectionLayout {
    var onViewModelSet:(() -> ())?
    
    override var viewModel:LandingViewModelCollectionLayout {
        didSet {
            self.onViewModelSet?()
        }
    }
}
