import Foundation
@testable import catban

class MockLandingViewModelLoader:LandingViewModelLoaderProtocol {
    var onLoadCalled:(() -> Void)?
    
    func factoryWith(model:LandingProtocol) -> LandingViewModel {
        self.onLoadCalled?()
        
        let viewModel:LandingViewModel = LandingViewModel()
        return viewModel
    }
}
