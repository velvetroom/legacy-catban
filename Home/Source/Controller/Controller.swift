import Foundation
import Shared

public class Controller:ControllerProtocol {
    public var presenter:PresenterProtocol
    public var transiton:TransitionProtocol!
    
    public required init() {
        self.presenter = Presenter()
        self.presenter.delegate = self
    }
}
