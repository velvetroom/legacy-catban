import Foundation
@testable import catban

class MockLandingViewModelLoader:LandingViewModelLoaderProtocol {
    var onLoadCalled:(() -> Void)?
    
    func factoryWith(model:Landing) -> LandingViewModel {
        self.onLoadCalled?()
        
        let viewModel:LandingViewModel = LandingViewModel()
        return viewModel
    }
}
