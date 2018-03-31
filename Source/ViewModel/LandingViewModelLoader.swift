import Foundation

class LandingViewModelLoader:LandingViewModelLoaderProtocol {
    var editingCard:IndexPath?
    let outlets:LandingViewModelLoaderOutlets
    let collection:LandingViewModelLoaderCollection
    
    init() {
        self.outlets = LandingViewModelLoaderOutlets()
        self.collection = LandingViewModelLoaderCollection()
    }
    
    func factoryWith(project:Project) -> LandingViewModel {
        var viewModel:LandingViewModel = LandingViewModel()
        viewModel.outlets = self.factoryOutletsWith(project:project)
        viewModel.collection = self.collection.factoryWith(project:project)
        return viewModel
    }
    
    private func factoryOutletsWith(project:Project) -> LandingViewModelOutlets {
        var outlets:LandingViewModelOutlets = self.outlets.factoryWith(project:project)
        if let _:IndexPath = self.editingCard {
            outlets.collectionMenuBottom = 0
        }
        return outlets
    }
}
