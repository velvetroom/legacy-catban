import Foundation
@testable import Shared
@testable import Board

class MockTransitionProtocol:TransitionProtocol {
    var onTransitionToHome:(() -> Void)?
    
    func transitionToLoad() { }
    func transitionTo(card:CardProtocol, in project:ProjectManagedProtocol) { }
    func transitionTo(column:ColumnProtocol, in project:ProjectManagedProtocol) { }
    func transitionToProjects(board:BoardProjectsProtocol) { }
    func present(view: ViewProtocol) { }
    func pushTo(view: ViewProtocol) { }
    func pop() { }
    
    func transitionToHome(project:ProjectManagedProtocol) {
        self.onTransitionToHome?()
    }
}
