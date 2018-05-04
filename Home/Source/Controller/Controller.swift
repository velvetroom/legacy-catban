import Foundation
import Shared

class Controller:ControllerProtocol {
    var presenter:PresenterProtocol
    
    required init() {
        self.presenter = Presenter()
        self.presenter.controller = self
    }
}
