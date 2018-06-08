import Foundation
import Shared

class Presenter:PresenterProtocol {
    weak var controller:Controller!
    let interactor:InteractorProtocol
    
    init() {
        self.controller = Controller()
        self.interactor = self.controller
        self.controller.presenter = self
    }
}
