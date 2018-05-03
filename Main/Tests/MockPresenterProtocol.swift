import Foundation
@testable import Shared

class MockPresenterProtocol:PresenterProtocol {
    var view:View
    
    init() {
        self.view = View()
    }
}
