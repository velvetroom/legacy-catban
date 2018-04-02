import Foundation

class LandingViewModelLoaderOutlets {
    var collectionLayout:LandingViewModelLoaderCollectionLayout
    var collectionMenu:LandingViewModelLoaderCollectionMenu
    private var firstTime:Bool
    
    init() {
        self.collectionLayout = LandingViewModelLoaderCollectionLayout()
        self.collectionMenu = LandingViewModelLoaderCollectionMenu()
        self.firstTime = true
    }
    
    func factoryWith(model:LandingProtocol) -> LandingViewModelOutlets {
        var viewModel:LandingViewModelOutlets = LandingViewModelOutlets()
        viewModel = self.configure(viewModel:viewModel, project:model.project)
        viewModel = self.configureForFirstTime(viewModel:viewModel)
        viewModel = self.configureDefaults(viewModel:viewModel)
        viewModel.collectionLayout = self.collectionLayout.factoryWith(model:model)
        viewModel.collectionMenu = self.collectionMenu.factoryWith(model:model)
        return viewModel
    }
    
    private func configure(viewModel:LandingViewModelOutlets, project:ProjectProtocol?) -> LandingViewModelOutlets {
        var viewModel:LandingViewModelOutlets = viewModel
        if let project:ProjectProtocol = project {
            viewModel.title = project.name
        }
        return viewModel
    }
    
    private func configureForFirstTime(viewModel:LandingViewModelOutlets) -> LandingViewModelOutlets {
        var viewModel:LandingViewModelOutlets = viewModel
        if self.firstTime {
            self.firstTime = false
            viewModel.reloadCollection = true
        }
        return viewModel
    }
    
    private func configureDefaults(viewModel:LandingViewModelOutlets) -> LandingViewModelOutlets {
        var viewModel:LandingViewModelOutlets = viewModel
        viewModel.logoHidden = Constants.logoHidden
        return viewModel
    }
}
