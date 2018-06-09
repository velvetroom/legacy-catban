import Foundation
import Shared

public class Presenter:PresenterProtocol {
    public weak var view:ViewProtocol!
    weak var controller:Controller!
    public let interactor:InteractorProtocol
    
    public required init() {
        let controller:Controller = Controller()
        self.controller = controller
        self.interactor = controller
        self.controller.presenter = self
    }
}
