import Foundation
import Shared

class Presenter:PresenterProtocol {
    let interactor:InteractorProtocol
    weak var controller:Controller!
    
    init() {
        self.controller = Controller()
        self.interactor = self.controller
        self.controller.presenter = self
    }
}
