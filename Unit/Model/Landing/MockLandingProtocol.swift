import Foundation
@testable import catban

class MockLandingProtocol:LandingProtocol {
    var onReloadViewModel:(() -> Void)?
    var onMoveCard:((IndexPath, IndexPath) -> Void)?
    var project:ProjectProtocol?
    var editingCard:IndexPath?
    var projectLoader:ProjectLoaderProtocol
    var viewModelLoader:LandingViewModelLoaderProtocol
    var presenter:LandingPresenterProtocol
    
    init() {
        self.projectLoader = ProjectLoader()
        self.viewModelLoader = LandingViewModelLoader()
        self.presenter = LandingPresenter()
    }
    
    func load() {
        
    }
    
    func reloadViewModel() {
        self.onReloadViewModel?()
    }
    
    func update(editingCard:IndexPath?) {
        
    }
    
    func moveEditingCardRight() {
        
    }
    
    func moveCardFrom(origin:IndexPath, to destination:IndexPath) {
        self.onMoveCard?(origin, destination)
    }
}
