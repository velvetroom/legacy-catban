import Foundation
import CleanArchitecture
import Architecture
import Board

class MockTransitionProtocol:TransitionProtocol {
    var onTransitionToHome:(() -> Void)?
    var onPresent:(() -> Void)?
    var onPush:((ViewProtocol) -> Void)?
    
    func transitionToLoad() { }
    func transitionTo(card:CardProtocol, board:BoardProtocol, project:ProjectProtocol) { }
    func transitionTo(column:ColumnProtocol, board:BoardProtocol, project:ProjectProtocol) { }
    func transitionToProjects(board:BoardProtocol) { }
    func pop() { }
    func dismiss() { }
    
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
