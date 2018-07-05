import Foundation
import Architecture
import CleanArchitecture
import Board

class MockTransitionProtocol:TransitionProtocol {
    var onTransitionToHome:(() -> Void)?
    var onPresent:(() -> Void)?
    var onDismiss:(() -> Void)?
    var view:ViewProtocol?
    
    func transitionToHome(board:BoardProtocol, project:ProjectProtocol) {
        self.onTransitionToHome?()
    }
    
    func present(view:ViewProtocol) {
        self.view = view
        self.onPresent?()
    }
    
    func dismiss() {
        self.onDismiss?()
    }
}
