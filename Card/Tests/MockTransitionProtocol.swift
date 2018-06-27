import Foundation
import CleanArchitecture
import Architecture
import Board

class MockTransitionProtocol:TransitionProtocol {
    var onTransitionToHome:(() -> Void)?
    var onPresent:(() -> Void)?
    
    func transitionToLoad() { }
    func transitionTo(card:CardProtocol, in project:ProjectManagedProtocol) { }
    func transitionTo(column:ColumnProtocol, in project:ProjectManagedProtocol) { }
    func transitionToProjects(board:BoardProjectsProtocol) { }
    func pushTo(view:ViewProtocol) { }
    func pop() { }
    func dismiss() { }
    
    func transitionToHome(project:ProjectManagedProtocol) {
        self.onTransitionToHome?()
    }
    
    func present(view:ViewProtocol) {
        self.onPresent?()
    }
}
