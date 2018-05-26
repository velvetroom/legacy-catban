import Foundation
import Shared

class Presenter:PresenterProtocol {
    var viewType:Shared.View.Type = Projects.View.self
    weak var delegate:PresenterDelegateProtocol!
    weak var controller:Controller!
    
    func presenterDidLoadWith(view:Shared.View) {
        self.configure(view:view)
        self.loadOutlets(view:view)
    }
    
    private func configure(view:Shared.View) {
        guard
            let view:View = view as? Projects.View
        else { return }
        view.presenter = self
    }
    
    private func loadOutlets(view:Shared.View) {
        
    }
}
