import Foundation
import Shared
import Board

class MockTransitionProtocol:TransitionProtocol {
    var onPush:(() -> Void)?
    var onPresent:(() -> Void)?
    var onTransitionToHome:(() -> Void)?
    
    func transitionToLoad() { }
    func transitionTo(card:CardProtocol, in project:ProjectManagedProtocol) { }
    func transitionTo(column:ColumnProtocol, in project:ProjectManagedProtocol) { }
    func transitionToProjects(board:BoardProjectsProtocol) { }
    func pop() { }
    func dismiss() { }
    
    func present(view:ViewProtocol) {
        self.onPresent?()
    }
    
    func pushTo(view:ViewProtocol) {
        self.onPush?()
    }
    
    func transitionToHome(project:ProjectManagedProtocol) {
        self.onTransitionToHome?()
    }
}
