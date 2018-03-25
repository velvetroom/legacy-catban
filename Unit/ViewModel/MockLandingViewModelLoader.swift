import Foundation
@testable import catban

class MockLandingViewModelLoader:LandingViewModelLoaderProtocol {
    var onLoadCalled:(() -> Void)?
    
    func load(project:Project, completion:@escaping((LandingViewModel) -> Void)) {
        self.onLoadCalled?()
        
        let viewModel:LandingViewModel = LandingViewModel()
        completion(viewModel)
    }
}
