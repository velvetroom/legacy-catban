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
        viewModel = self.configureEditing(viewModel:viewModel, with:model)
        viewModel = self.configureForFirstTime(viewModel:viewModel)
        viewModel = self.configureDefaults(viewModel:viewModel)
        return viewModel
    }
    
    private func configure(viewModel:LandingViewModelOutlets, project:ProjectProtocol?) -> LandingViewModelOutlets {
        var viewModel:LandingViewModelOutlets = viewModel
        if let project:ProjectProtocol = project {
            viewModel.collectionLayout = self.collectionLayout.factoryWith(project:project)
            viewModel.title = project.name
        }
        return viewModel
    }
    
    private func configureEditing(viewModel:LandingViewModelOutlets,
                                  with model:LandingProtocol) -> LandingViewModelOutlets {
        var viewModel:LandingViewModelOutlets = viewModel
        if let index:IndexPath = model.editingCard {
            viewModel.collectionMenu = self.configureMenuEditing(index:index, with:model)
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
    
    private func configureMenuEditing(index:IndexPath,
                                      with model:LandingProtocol) -> LandingViewModelCollectionMenu {
        var viewModel:LandingViewModelCollectionMenu = LandingViewModelCollectionMenu()
        viewModel.layoutBottom = 0
        return viewModel
    }
}
