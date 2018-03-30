import Foundation

protocol LandingViewModelLoaderProtocol {
    func factoryWith(project:Project) -> LandingViewModel
    func factoryWith(project:Project, and selectedCell:IndexPath) -> LandingViewModel
}
