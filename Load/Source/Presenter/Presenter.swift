import Foundation
import Shared

class Presenter:PresenterProtocol {
    weak var controller:Controller!
    let interactor:InteractorProtocol
    
    required init() {
        let controller:Controller = Controller()
        self.controller = controller
        self.interactor = controller
        self.controller.presenter = self
    }
}
