import Foundation
@testable import Home
@testable import Board

class MockController:Controller {
    var onEditCard:((CardProtocol) -> Void)?
    
    override func editCard(card:CardProtocol) {
        self.onEditCard?(card)
    }
}
