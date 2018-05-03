import Foundation
import Shared

public class Controller:ControllerProtocol {
    public var presenter:PresenterProtocol
    
    public init() {
        self.presenter = Presenter()
    }
}
