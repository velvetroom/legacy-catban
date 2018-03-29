import UIKit
@testable import catban

class MockLandingPresenterCollectionDataSource:LandingPresenterCollectionDataSource {
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