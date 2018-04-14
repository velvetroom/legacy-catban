import Foundation

class ErrorModel:LandingErrorProtocol {
    var message:String
    var presenter:ErrorPresenter
    
    init() {
        self.message = String()
        self.presenter = ErrorPresenter()
    }
}
