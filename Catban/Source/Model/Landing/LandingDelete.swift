import Foundation

class LandingDelete:LandingDeleteProtocol {
    var onConfirm:(() -> Void)?
    var itemName:String
    var presenter:LandingDeletePresenter
    
    init() {
        self.itemName = String()
        self.presenter = LandingDeletePresenter()
    }
}
