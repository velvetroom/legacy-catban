import Foundation
@testable import catban

class MockLandingProtocol:LandingProtocol {
    var onReloadViewModel:(() -> Void)?
    var onMoveCardFrom:((IndexPath, IndexPath) -> Void)?
    var onMoveCardLeft:(() -> Void)?
    var onMoveCardRight:(() -> Void)?
    var onEditingCard:((String) -> Void)?
    var onClearCardSelection:(() -> Void)?
    var project:ProjectProtocol
    var editingCard:IndexPath?
    var viewModelLoader:LandingViewModelLoaderProtocol
    var presenter:LandingPresenterProtocol
    var editingCardReference:ProjectCard?
    
    init() {
        self.project = Project()
        self.viewModelLoader = LandingViewModelLoader()
        self.presenter = LandingPresenter()
    }
    
    func load() {
        
    }
    
    func reloadViewModel() {
        self.onReloadViewModel?()
    }
    
    func clearCardSelection() {
        self.onClearCardSelection?()
    }
    
    func update(editingCard:IndexPath?) {
        
    }
    
    func updateEditingCard(title:String) {
        self.onEditingCard?(title)
    }
    
    func moveEditingCardRight() {
        self.onMoveCardRight?()
    }
    
    func moveEditingCardLeft() {
        self.onMoveCardLeft?()
    }
    
    func moveCardFrom(origin:IndexPath, to destination:IndexPath) {
        self.onMoveCardFrom?(origin, destination)
    }
    
    func scrollToEditingCard() {
        
    }
}
