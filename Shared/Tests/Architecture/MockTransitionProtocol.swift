import Foundation
import Board
@testable import Shared

class MockTransitionProtocol:TransitionProtocol {
    func transitionToLoad() { }
    func transitionToHome(project:ProjectManagedProtocol) { }
    func transitionToProjects(board:BoardProjectsProtocol) { }
    func transitionTo(card:CardProtocol, in project:ProjectManagedProtocol) { }
    func transitionTo(column:ColumnProtocol, in project:ProjectManagedProtocol) { }
    func pushTo(view:ViewProtocol) { }
    func pop() { }
    func present(view:ViewProtocol) { }
    func dismiss() { }
}
