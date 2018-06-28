import Foundation
import CleanArchitecture
import Architecture
import Board

class MockTransitionProtocol:TransitionProtocol {
    var onTransitionToHome:(() -> Void)?
    var onPresent:(() -> Void)?
    var onPush:((ViewProtocol) -> Void)?
    
    func pushTo(view:ViewProtocol) {
        self.onPush?(view)
    }
    
    func transitionToHome(board:BoardProtocol, project:ProjectProtocol) {
        self.onTransitionToHome?()
    }
    
    func present(view:ViewProtocol) {
        self.onPresent?()
    }
}
