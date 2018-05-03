import Foundation
import Shared

class Presenter:PresenterProtocol {
    var controller:ControllerProtocol!
    var view:Shared.View
    
    init() {
        self.view = View()
        self.view.delegate = self
    }
}
