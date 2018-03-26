import Foundation

class LandingViewModelLoader:LandingViewModelLoaderProtocol {
    let collection:LandingViewModelLoaderCollection
    let collectionLayout:LandingViewModelLoaderCollectionLayout
    private struct Constants {
        static let logoHidden:Bool = true
    }
    
    init() {
        self.collection = LandingViewModelLoaderCollection()
        self.collectionLayout = LandingViewModelLoaderCollectionLayout()
    }
    
    func factoryViewModelWith(project:Project) -> LandingViewModel {
        var viewModel:LandingViewModel = LandingViewModel()
        viewModel.logoHidden = Constants.logoHidden
        viewModel.collection = self.collection.factoryWith(project:project)
        viewModel.collectionLayout = self.collectionLayout.factoryWith(project:project)
        return viewModel
    }
}
