import Foundation
@testable import catban

class MockLandingProtocol:LandingProtocol {
    var onReloadViewModel:(() -> Void)?
    var onReorderItem:((Int, Int, Int) -> Void)?
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
    
    func moveEditinCardRight() {
        
    }
    
    func reorderItemFrom(index:Int, to destination:Int, in section:Int) {
        self.onReorderItem?(index, destination, section)
    }
}
