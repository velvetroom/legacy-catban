import Foundation
@testable import Board

class MockProjectManagedProtocol:ProjectManaged {
    var onAddCard:((CardProtocol) -> Void)?
    
    override func add(card:CardProtocol) {
        self.onAddCard?(card)
    }
}
