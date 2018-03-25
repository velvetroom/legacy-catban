import Foundation

protocol LandingViewModelLoaderProtocol {
    func load(project:Project, completion:@escaping((LandingViewModel) -> Void))
}
