import Foundation

class LandingViewModelLoader:LandingViewModelLoaderProtocol {
    func load(project:Project, completion:@escaping((LandingViewModel) -> Void)) {
        let viewModel:LandingViewModel = LandingViewModel()
        completion(viewModel)
    }
}
