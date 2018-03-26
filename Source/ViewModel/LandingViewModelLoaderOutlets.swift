import Foundation

class LandingViewModelLoaderOutlets {
    func factoryWith(project:Project) -> LandingViewModelOutlets {
        var viewModel:LandingViewModelOutlets = LandingViewModelOutlets()
        viewModel.logoHidden = Constants.logoHidden
        viewModel.title = project.name
        return viewModel
    }
}
