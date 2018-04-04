import Foundation

class Landing:LandingProtocol {
    var project:ProjectProtocol
    var viewModelLoader:LandingViewModelLoaderProtocol
    var presenter:LandingPresenterProtocol
    var editingCard:IndexPath?
    var editingCardReference:ProjectCard? {
        get {
            guard
                let editingCard:IndexPath = self.editingCard
            else {
                return nil
            }
            return self.project.cardAt(indexPath:editingCard)
        }
    }
    
    init() {
        self.project = Project.factoryNewProject()
        self.viewModelLoader = LandingViewModelLoader()
        self.presenter = LandingPresenter()
    }
}
