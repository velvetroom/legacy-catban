import Foundation

protocol LandingViewModelLoaderProtocol {
    var editingCard:IndexPath? { get set }
    
    func factoryWith(project:Project) -> LandingViewModel
}
