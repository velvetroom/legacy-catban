import Foundation

class LandingViewModelLoader:LandingViewModelLoaderProtocol {
    private struct Constants {
        static let logoHidden:Bool = true
    }
    
    func factoryViewModelWith(project:Project) -> LandingViewModel {
        var viewModel:LandingViewModel = LandingViewModel()
        viewModel.logoHidden = Constants.logoHidden
        viewModel.collection = self.factoryCollectionWith(project:project)
        viewModel.collectionLayout = self.factoryCollectionLayoutWith(project:project)
        return viewModel
    }
}
