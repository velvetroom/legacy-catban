import Foundation
import Architecture
import Board

class MockTransitionProtocol:TransitionProtocol {
    var onTransitionToHome:(() -> Void)?
    
    func transitionToHome(board:BoardProtocol, project:ProjectProtocol) {
        self.onTransitionToHome?()
    }
}
