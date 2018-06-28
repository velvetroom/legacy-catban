import Foundation
import CleanArchitecture
import Architecture
import Board

class MockTransitionProtocol:TransitionProtocol {
    var onTransitionToHome:(() -> Void)?
    var onPresent:(() -> Void)?
    
    func transitionToLoad() { }
    func transitionTo(card:CardProtocol, board:BoardProtocol, project:ProjectProtocol) { }
    func transitionTo(column:ColumnProtocol, board:BoardProtocol, project:ProjectProtocol) { }
    func transitionToProjects(board:BoardProtocol) { }
    func pushTo(view:ViewProtocol) { }
    func pop() { }
    func dismiss() { }
    
    func transitionToHome(board:BoardProtocol, project:ProjectProtocol) {
        self.onTransitionToHome?()
    }
    
    func present(view:ViewProtocol) {
        self.onPresent?()
    }
}
