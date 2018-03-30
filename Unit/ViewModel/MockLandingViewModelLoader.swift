import Foundation
@testable import catban

class MockLandingViewModelLoader:LandingViewModelLoaderProtocol {
    var onLoadCalled:(() -> Void)?
    
    func factoryWith(project:Project) -> LandingViewModel {
        self.onLoadCalled?()
        
        let viewModel:LandingViewModel = LandingViewModel()
        return viewModel
    }
    
    func factoryWith(project:Project, and selectedCell:IndexPath) -> LandingViewModel {
        let viewModel:LandingViewModel = LandingViewModel()
        return viewModel
    }
}
