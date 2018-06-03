import Foundation
@testable import Shared
@testable import Board

class MockTransitionProtocol:TransitionProtocol {
    var onTransitionToHome:((ProjectManagedProtocol) -> Void)?
    var onTransitionToProjects:(() -> Void)?
    
    func transitionToLoad() { }
    func transitionTo(card:CardProtocol, in project:ProjectManagedProtocol) { }
    func transitionTo(column:ColumnProtocol, in project:ProjectManagedProtocol) { }
    
    func transitionToProjects(board:BoardProjectsProtocol) {
        self.onTransitionToProjects?()
    }
    
    func transitionToHome(project:ProjectManagedProtocol) {
        self.onTransitionToHome?(project)
    }
}
