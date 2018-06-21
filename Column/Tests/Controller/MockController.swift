import Foundation
@testable import Column

class MockController:Interactor {
    var onDone:(() -> Void)?
    var onDelete:(() -> Void)?
    
    override func done() {
        self.onDone?()
    }
    
    override func delete() {
        self.onDelete?()
    }
}
