import Foundation
import CleanArchitecture
import Architecture
import Board

class MockTransitionProtocol:TransitionProtocol {
    var onTransitionToHome:((ProjectManagedProtocol) -> Void)?
    var onTransitionToProjects:(() -> Void)?
    
    func transitionToLoad() { }
    func transitionTo(card:CardProtocol, in project:ProjectManagedProtocol) { }
    func transitionTo(column:ColumnProtocol, in project:ProjectManagedProtocol) { }
    func pushTo(view:ViewProtocol) { }
    func pop() { }
    func present(view:ViewProtocol) { }
    func dismiss() { }
    
    func transitionToProjects(board:ProjectManagerProtocol) {
        self.onTransitionToProjects?()
    }
    
    func transitionToHome(project:ProjectManagedProtocol) {
        self.onTransitionToHome?(project)
    }
}
