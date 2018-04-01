import Foundation

class LandingViewModelLoaderOutlets {
    let collectionLayout:LandingViewModelLoaderCollectionLayout
    private var firstTime:Bool
    
    init() {
        self.collectionLayout = LandingViewModelLoaderCollectionLayout()
        self.firstTime = true
    }
    
    func factoryWith(model:Landing) -> LandingViewModelOutlets {
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
    
    private func configureEditing(viewModel:LandingViewModelOutlets, with model:Landing) -> LandingViewModelOutlets {
        var viewModel:LandingViewModelOutlets = viewModel
        if let _:IndexPath = model.editingCard {
            viewModel.collectionMenuBottom = 0
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
