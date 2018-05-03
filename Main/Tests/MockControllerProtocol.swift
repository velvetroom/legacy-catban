import Foundation
@testable import Shared

class MockControllerProtocol:ControllerProtocol {
    var presenter:PresenterProtocol
    
    init() {
        self.presenter = MockPresenterProtocol()
    }
}
