import Foundation
@testable import Shared
@testable import Board

class MockTransitionProtocol:TransitionProtocol {
    var onTransitionToCard:((CardProtocol, ProjectManagedProtocol) -> Void)?
    var onTransitionToColumn:(() -> Void)?
    
    func transitionToLoad() { }
    func transitionToHome(project:ProjectManagedProtocol) { }
    
    func transitionTo(column:ColumnProtocol, in project:ProjectManagedProtocol) {
        self.onTransitionToColumn?()
    }
    
    func transitionTo(card:CardProtocol, in project:ProjectManagedProtocol) {
        self.onTransitionToCard?(card, project)
    }
}
