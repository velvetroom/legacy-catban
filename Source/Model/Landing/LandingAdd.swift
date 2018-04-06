import Foundation

class LandingAdd:LandingAddProtocol {
    var delegate:LandingAddControllerDelegateProtocol?
    var presenter:LandingAddPresenter
    
    init() {
        self.presenter = LandingAddPresenter()
    }
}
