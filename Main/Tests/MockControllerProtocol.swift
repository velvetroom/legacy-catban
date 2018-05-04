import Foundation
@testable import Shared

class MockControllerProtocol:ControllerProtocol {
    var transiton:TransitionProtocol!
    var presenter:PresenterProtocol
    
    required init() {
        self.presenter = MockPresenterProtocol()
    }
}
