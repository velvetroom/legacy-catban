import Foundation
@testable import Shared

class MockPresenterProtocol:PresenterProtocol {
    var delegate:PresenterDelegateProtocol!
    var view:View
    
    init() {
        self.view = View()
    }
}
