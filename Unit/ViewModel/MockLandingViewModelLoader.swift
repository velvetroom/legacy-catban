import Foundation
@testable import catban

class MockLandingViewModelLoader:LandingViewModelLoaderProtocol {
    var onLoadCalled:(() -> Void)?
    
    func factoryViewModelWith(project:Project) -> LandingViewModel {
        self.onLoadCalled?()
        
        let viewModel:LandingViewModel = LandingViewModel()
        return viewModel
    }
}
