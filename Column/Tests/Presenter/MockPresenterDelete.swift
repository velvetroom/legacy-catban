import Foundation
@testable import Column

class MockPresenterDelete:PresenterDelete {
    static var presenter:PresenterDelete?
    
    override func askConfirmation() {
        MockPresenterDelete.presenter = self
    }
}
