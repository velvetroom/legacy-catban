import Foundation
@testable import Projects

class MockPresenterDelete:PresenterDelete {
    static var presenter:PresenterDelete?
    
    override func askConfirmation() {
        MockPresenterDelete.presenter = self
    }
}
