import Foundation

class LandingColumnEdit:LandingColumnEditProtocol {
    var onRename:(() -> Void)?
    var onDelete:(() -> Void)?
    var presenter:LandingColumnEditPresenter
    
    init() {
        self.presenter = LandingColumnEditPresenter()
    }
}
