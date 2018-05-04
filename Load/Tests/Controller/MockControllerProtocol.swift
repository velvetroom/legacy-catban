import Foundation
@testable import Shared

class MockControllerProtocol:ControllerProtocol {
    var onViewDidLoad:(() -> Void)?
    var transiton:TransitionProtocol!
    var presenter:PresenterProtocol
    
    required init() {
        self.presenter = MockPresenterProtocol()
    }
    
    func viewDidLoad() {
        self.onViewDidLoad?()
    }
}
