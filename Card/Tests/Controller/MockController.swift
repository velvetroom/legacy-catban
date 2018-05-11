import Foundation
@testable import Card

class MockController:Controller {
    var onDone:(() -> Void)?
    
    override func done() {
        self.onDone?()
    }
}
