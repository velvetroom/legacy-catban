import Foundation
import CleanArchitecture
import Architecture
import Board

class MockTransitionProtocol:TransitionProtocol {
    var onTransitionToHome:(() -> Void)?
    var onTransitionToCloud:(() -> Void)?
    var onPresent:(() -> Void)?
    var onPush:((ViewProtocol) -> Void)?
    var view:ViewProtocol?
    
    func pushTo(view:ViewProtocol) {
        self.onPush?(view)
    }
    
    func transitionToHome(board:BoardProtocol, project:ProjectProtocol) {
        self.onTransitionToHome?()
    }
    
    func transitionToCloud(board:BoardProtocol, project:ProjectProtocol) {
        self.onTransitionToCloud?()
    }
    
    func present(view:ViewProtocol) {
        self.view = view
        self.onPresent?()
    }
}
