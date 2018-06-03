import Foundation
@testable import Shared

class MockControllerProtocol_Default:ControllerProtocol {
    var transiton:TransitionProtocol!
    var presenter:PresenterProtocol
    
    required init() {
        self.presenter = MockPresenterProtocol()
    }
}
