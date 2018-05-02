import Foundation
@testable import catban

class MockLandingState:LandingState {
    var onMoveCardLeft:(() -> Void)?
    var onMoveCardRight:(() -> Void)?
    var onDeleteCard:(() -> Void)?
    
    override func moveCardLeft() {
        self.onMoveCardLeft?()
    }
    
    override func moveCardRight() {
        self.onMoveCardRight?()
    }
    
    override func deleteCard() {
        self.onDeleteCard?()
    }
}
