import Foundation

class Landing:LandingProtocol {
    var board:BoardProtocol
    var viewModelLoader:LandingViewModelLoaderProtocol
    var presenter:LandingPresenterProtocol
    var update:UpdateFactoryProtocol
    var editingCard:IndexPath?
    var state:LandingState
    
    required init() {
        self.board = Board()
        self.viewModelLoader = LandingViewModelLoader()
        self.presenter = LandingPresenter()
        self.update = UpdateFactory()
        self.state = LandingStateStandby()
        self.state.delegate = self
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
