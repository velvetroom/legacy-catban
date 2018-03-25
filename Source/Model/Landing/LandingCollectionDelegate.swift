import Foundation

class LandingCollectionDelegate:LandingCollectionDelegateProtocol {
    var viewModel:LandingViewModelCollection
    
    init() {
        self.viewModel = LandingViewModelCollection()
    }
}
