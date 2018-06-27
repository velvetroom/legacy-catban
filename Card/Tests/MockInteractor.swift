import Foundation
@testable import Card

class MockInteractor:Interactor {
    var onDone:(() -> Void)?
    var onDeleteConfirmed:(() -> Void)?
    
    override func done() {
        self.onDone?()
    }
    
    override func deleteConfirmed() {
        self.onDeleteConfirmed?()
    }
}
