import Foundation
import Shared

public class Controller:ControllerProtocol {
    public var transiton:TransitionProtocol!
    public var presenter:PresenterProtocol
    
    public required init() {
        self.presenter = Presenter()
        self.presenter.delegate = self
    }
}
