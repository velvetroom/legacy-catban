import Foundation

class Landing:LandingProtocol {
    
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
}
