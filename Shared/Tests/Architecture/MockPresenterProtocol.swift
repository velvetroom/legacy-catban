import Foundation
@testable import Shared

class MockPresenterProtocol:PresenterProtocol {
    var controller:ControllerProtocol!
    var view:View
    
    init() {
        self.view = View()
    }
}
