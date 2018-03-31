import Foundation

class LandingViewModelLoader:LandingViewModelLoaderProtocol {
    let outlets:LandingViewModelLoaderOutlets
    let collection:LandingViewModelLoaderCollection
    
    init() {
        self.outlets = LandingViewModelLoaderOutlets()
        self.collection = LandingViewModelLoaderCollection()
    }
    
    func factoryWith(model:Landing) -> LandingViewModel {
        var viewModel:LandingViewModel = LandingViewModel()
        viewModel.outlets = self.outlets.factoryWith(model:model)
        viewModel.collection = self.collection.factoryWith(model:model)
        return viewModel
    }
}
