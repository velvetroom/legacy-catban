import Foundation
import Shared
import Board

public class Controller:ControllerProjectProtocol {
    public var presenter:PresenterProtocol
    public var project:ProjectManagedProtocol!
    public var transiton:TransitionProtocol!
    
    public required init() {
        self.presenter = Presenter()
        self.presenter.delegate = self
    }
}
