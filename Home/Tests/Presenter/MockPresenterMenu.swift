import Foundation
@testable import Home

class MockPresenterMenu:PresenterMenu {
    static var presenter:PresenterMenu?
    
    override func show() {
        MockPresenterMenu.presenter = self
    }
}
