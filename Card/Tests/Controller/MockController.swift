import Foundation
@testable import Card

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
