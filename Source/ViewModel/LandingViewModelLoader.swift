import Foundation

class LandingViewModelLoader:LandingViewModelLoaderProtocol {
    let outlets:LandingViewModelLoaderOutlets
    let collection:LandingViewModelLoaderCollection
    let collectionLayout:LandingViewModelLoaderCollectionLayout
    
    init() {
        self.outlets = LandingViewModelLoaderOutlets()
        self.collection = LandingViewModelLoaderCollection()
        self.collectionLayout = LandingViewModelLoaderCollectionLayout()
    }
    
    func factoryViewModelWith(project:Project) -> LandingViewModel {
        var viewModel:LandingViewModel = LandingViewModel()
        viewModel.outlets = self.outlets.factoryWith(project:project)
        viewModel.collection = self.collection.factoryWith(project:project)
        viewModel.collectionLayout = self.collectionLayout.factoryWith(project:project)
        return viewModel
    }
}
