import Foundation
import Shared

public class Presenter:PresenterViewProtocol {
    public var interactor:Controller
    public weak var view:ViewProtocol!
    
    public required init() {
        self.interactor = Controller()
        self.interactor.presenter = self
    }
}
