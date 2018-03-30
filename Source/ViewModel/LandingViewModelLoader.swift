import Foundation

class LandingViewModelLoader:LandingViewModelLoaderProtocol {
    let outlets:LandingViewModelLoaderOutlets
    let collection:LandingViewModelLoaderCollection
    
    init() {
        self.outlets = LandingViewModelLoaderOutlets()
        self.collection = LandingViewModelLoaderCollection()
    }
    
    func factoryWith(project:Project) -> LandingViewModel {
        var viewModel:LandingViewModel = LandingViewModel()
        viewModel.outlets = self.outlets.factoryWith(project:project)
        viewModel.collection = self.collection.factoryWith(project:project)
        return viewModel
    }
    
    func factoryWith(project:Project, and selectedCell:IndexPath) -> LandingViewModel {
        var viewModel:LandingViewModel = LandingViewModel()
        viewModel.outlets = self.outlets.factoryWith(project:project, and:selectedCell)
        viewModel.collection = self.collection.factoryWith(project:project)
        return viewModel
    }
}
