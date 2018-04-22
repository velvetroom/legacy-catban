import Foundation

class Landing:LandingProtocol {
    var board:BoardProtocol
    var viewModelLoader:LandingViewModelLoaderProtocol
    var presenter:LandingPresenterProtocol
    var collectionUpdateFactory:LandingCollectionUpdateFactoryProtocol
    var editingCard:IndexPath?
    var project:ProjectProtocol {
        get {
            return self.board.project
        }
        set(newValue) {
            self.board.project = newValue
        }
    }
    
    var editingCardReference:ProjectCard? {
        get {
            guard
                let editingCard:IndexPath = self.editingCard
            else { return nil }
            return self.project.cardAt(indexPath:editingCard)
        }
    }
    
    required init() {
        self.board = Board()
        self.viewModelLoader = LandingViewModelLoader()
        self.presenter = LandingPresenter()
        self.collectionUpdateFactory = LandingCollectionUpdateFactory()
    }
    
    func reloadViewModel() {
        let viewModel:LandingViewModel = self.viewModelLoader.factoryWith(model:self)
        self.presenter.update(viewModel:viewModel)
    }
}
