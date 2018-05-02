import Foundation
@testable import catban

class MockLandingState:LandingState {
    var onMoveCardLeft:(() -> Void)?
    var onMoveCardRight:(() -> Void)?
    
    override func moveCardLeft() {
        self.onMoveCardLeft?()
    }
    
    override func moveCardRight() {
        self.onMoveCardRight?()
    }
}
