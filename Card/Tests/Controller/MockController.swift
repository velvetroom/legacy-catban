import Foundation
@testable import Card

class MockController:Controller {
    var onDone:(() -> Void)?
    var onDelete:(() -> Void)?
    
    override func done() {
        self.onDone?()
    }
    
    override func delete() {
        self.onDelete?()
    }
}
