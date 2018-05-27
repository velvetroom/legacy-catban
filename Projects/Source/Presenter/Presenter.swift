import Foundation
import Shared

class Presenter:PresenterProtocol {
    var viewType:Shared.View.Type = Projects.View.self
    var outlets:PresenterOutlets
    weak var delegate:PresenterDelegateProtocol!
    weak var controller:Controller!
    
    init() {
        self.outlets = PresenterOutlets()
    }
    
    func presenterDidLoadWith(view:Shared.View) {
        guard
            let view:View = view as? Projects.View
        else { return }
        self.configure(view:view)
        self.loadOutlets(view:view)
    }
    
    func shouldUpdate() {
        
    }
    
    private func configure(view:View) {
        view.presenter = self
    }
    
    private func loadOutlets(view:View) {
        let loader:PresenterOutletsLoader = PresenterOutletsLoader()
        loader.view = view
        loader.load()
        self.outlets = loader.outlets
    }
}
