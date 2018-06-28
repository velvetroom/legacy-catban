import Foundation
import CleanArchitecture
import Architecture
import Board

class MockTransitionProtocol:TransitionProtocol {
    var onPush:(() -> Void)?
    var onPresent:(() -> Void)?
    var onTransitionToHome:(() -> Void)?
    
    func present(view:ViewProtocol) {
        self.onPresent?()
    }
    
    func pushTo(view:ViewProtocol) {
        self.onPush?()
    }
    
    func transitionToHome(board:BoardProtocol, project:ProjectProtocol) {
        self.onTransitionToHome?()
    }
}
