import Foundation

class LandingViewModelLoaderOutlets {
    let collectionLayout:LandingViewModelLoaderCollectionLayout
    private var firstTime:Bool
    
    init() {
        self.collectionLayout = LandingViewModelLoaderCollectionLayout()
        self.firstTime = true
    }
    
    func factoryWith(project:Project) -> LandingViewModelOutlets {
        var viewModel:LandingViewModelOutlets = LandingViewModelOutlets()
        viewModel.collectionLayout = self.collectionLayout.factoryWith(project:project)
        viewModel.logoHidden = Constants.logoHidden
        viewModel.title = project.name
        if self.firstTime {
            self.firstTime = false
            viewModel.reloadCollection = true
        }
        return viewModel
    }
}
