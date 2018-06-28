import Foundation
import CleanArchitecture
import Architecture
import Board

class MockTransitionProtocol:TransitionProtocol {
    var onPush:(() -> Void)?
    var onPresent:(() -> Void)?
    var onTransitionToHome:(() -> Void)?
    
    func transitionToLoad() { }
    func transitionTo(card:CardProtocol, board:BoardProtocol, project:ProjectProtocol) { }
    func transitionTo(column:ColumnProtocol, board:BoardProtocol, project:ProjectProtocol) { }
    func transitionToProjects(board:BoardProtocol) { }
    func pop() { }
    func dismiss() { }
    
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
