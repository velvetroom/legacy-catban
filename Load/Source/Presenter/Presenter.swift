import Foundation
import Shared

public class Presenter:PresenterProtocol {
    public var interactor:Controller
    public weak var view:PresenterViewProtocol!
    
    public required init() {
        self.interactor = Controller()
        self.interactor.presenter = self
    }
}
