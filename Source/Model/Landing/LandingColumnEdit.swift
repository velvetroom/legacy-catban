import Foundation

class LandingColumnEdit:LandingColumnEditProtocol {
    var onRename:(() -> Void)?
    var onDelete:(() -> Void)?
    var presenter:LandingColumnEditPresenter
    var itemName:String
    
    init() {
        self.presenter = LandingColumnEditPresenter()
        self.itemName = String()
    }
}
