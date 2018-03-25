import Foundation

class LandingViewModelLoader:LandingViewModelLoaderProtocol {
    func factoryViewModelWith(project:Project) -> LandingViewModel {
        let viewModel:LandingViewModel = LandingViewModel()
        return viewModel
    }
}
