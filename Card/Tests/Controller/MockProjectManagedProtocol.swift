import Foundation
@testable import Board

class MockProjectManagedProtocol:ProjectManaged {
    var onRemoveCard:(() -> Void)?
    
    override func remove(card:CardProtocol) {
        self.onRemoveCard?()
    }
}
