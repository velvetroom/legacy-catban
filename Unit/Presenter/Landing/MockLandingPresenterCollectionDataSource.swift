import UIKit
@testable import catban

class MockLandingPresenterCollectionDataSource:LandingPresenterCollectionDataSource {
    var onDidSetViewModel:(() -> Void)?
    
    override var viewModel:LandingViewModelCollection {
        didSet {
            self.onDidSetViewModel?()
        }
    }
}
