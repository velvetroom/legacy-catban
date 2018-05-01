import Foundation

class Landing:LandingProtocol {
    var board:BoardProtocol
    var viewModelLoader:LandingViewModelLoaderProtocol
    var presenter:LandingPresenterProtocol
    var update:UpdateFactoryProtocol
    var editingCard:IndexPath?
    
    required init() {
        self.board = Board()
        self.viewModelLoader = LandingViewModelLoader()
        self.presenter = LandingPresenter()
        self.update = UpdateFactory()
    }
    
    func reloadViewModel() {
        let viewModel:LandingViewModel = self.viewModelLoader.factoryWith(model:self)
        self.presenter.update(viewModel:viewModel)
    }
    
    func applyUpdates(updates:[UpdateProtocol]) {
        self.board.apply(updates:updates)
        self.reloadViewModel()
        self.presenter.apply(updates:updates)
    }
}
