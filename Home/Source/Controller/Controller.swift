import Foundation
import Shared

class Controller:ControllerProtocol {
    var presenter:PresenterProtocol
    
    init() {
        self.presenter = Presenter()
        self.presenter.controller = self
    }
}
