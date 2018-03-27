import UIKit

class LandingPresenterCollection:NSObject, LandingPresenterCollectionProtocol {
    var viewModel:LandingViewModelCollection
    
    override init() {
        self.viewModel = LandingViewModelCollection()
        super.init()
    }
}
