import Foundation
@testable import Card

class MockPresenterDelete:PresenterDelete {
    static var presenter:PresenterDelete?
    
    override func askConfirmation() {
        MockPresenterDelete.presenter = self
    }
}
