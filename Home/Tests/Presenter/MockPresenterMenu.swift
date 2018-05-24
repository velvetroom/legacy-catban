import Foundation
@testable import Home

class MockPresenterMenu:PresenterMenu {
    static var presenter:PresenterMenu?
    var onClose:(() -> Void)?
    
    override func show() {
        MockPresenterMenu.presenter = self
    }
    
    override func close() {
        self.onClose?()
    }
}
