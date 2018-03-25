import Foundation

protocol LandingViewModelLoaderProtocol {
    func factoryViewModelWith(project:Project) -> LandingViewModel
}
