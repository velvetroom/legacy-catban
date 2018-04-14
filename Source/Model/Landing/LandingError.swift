import Foundation

class LandingError:LandingErrorProtocol {
    var message:String
    var presenter:LandingErrorPresenter
    
    init() {
        self.message = String()
        self.presenter = LandingErrorPresenter()
    }
}
