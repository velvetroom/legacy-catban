import Foundation
@testable import Column

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
