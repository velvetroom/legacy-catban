import UIKit
@testable import catban

class MockLandingPresenterCollectionDataSource:LandingPresenterCollectionDataSource {
    var onViewModelSet:(() -> Void)?
    
    override init() {
        super.init()
    }
    
    override func update(viewModel:LandingViewModelCollection, reloadCollection:Bool) {
        self.onViewModelSet?()
        super.update(viewModel:viewModel, reloadCollection:reloadCollection)
    }
}
