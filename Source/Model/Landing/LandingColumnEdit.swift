import Foundation

class LandingColumnEdit:LandingEditProtocol {
    var onRename:(() -> Void)?
    var onDelete:(() -> Void)?
    var presenter:LandingEditPresenter
    var itemName:String
    
    init() {
        self.presenter = LandingEditPresenter()
        self.itemName = String()
    }
}
