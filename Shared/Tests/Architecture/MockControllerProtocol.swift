import Foundation
@testable import Shared

class MockControllerProtocol:ControllerProtocol {
    var presenter:PresenterProtocol
    
    required init() {
        self.presenter = MockPresenterProtocol()
    }
}
