import Foundation
import Shared

class Presenter:PresenterProtocol {
    var controller:ControllerProtocol!
    var view:View
    
    init() {
        self.view = View()
    }
}
