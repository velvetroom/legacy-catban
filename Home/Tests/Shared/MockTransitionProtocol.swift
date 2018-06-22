import Foundation
import Board
@testable import Shared

class MockTransitionProtocol:TransitionProtocol {
    var onTransitionToCard:(() -> Void)?
    var onTransitionToColumn:(() -> Void)?
    var onTransitionToProjects:(() -> Void)?
    var onPush:(() -> Void)?
    
    func transitionToLoad() { }
    func transitionToHome(project:ProjectManagedProtocol) { }
    func present(view:ViewProtocol) { }
    func pop() { }
    func dismiss() { }
    
    func transitionToProjects(board:BoardProjectsProtocol) {
        self.onTransitionToProjects?()
    }
    
    func transitionTo(column:ColumnProtocol, in project:ProjectManagedProtocol) {
        self.onTransitionToColumn?()
    }
    
    func transitionTo(card:CardProtocol, in project:ProjectManagedProtocol) {
        self.onTransitionToCard?()
    }
    
    func pushTo(view:ViewProtocol) {
        self.onPush?()
    }
}
