import Foundation
@testable import catban

class MockLandingViewModelLoader:LandingViewModelLoaderProtocol {
    var editingCard:IndexPath?
    var onLoadCalled:(() -> Void)?
    
    func factoryWith(project:Project) -> LandingViewModel {
        self.onLoadCalled?()
        
        let viewModel:LandingViewModel = LandingViewModel()
        return viewModel
    }
}
