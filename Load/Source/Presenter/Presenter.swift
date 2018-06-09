import Foundation
import Shared

public class Presenter:PresenterProtocol, ViewDelegateProtocol {
    public let interactor:Controller
    public weak var view:ViewProtocol!
    
    public required init() {
        self.interactor = Controller()
    }
}
