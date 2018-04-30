import Foundation

class ErrorModel:ErrorProtocol {
    var message:String
    var presenter:ErrorPresenter
    
    init() {
        self.message = String()
        self.presenter = ErrorPresenter()
    }
}
