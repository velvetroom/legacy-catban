import Foundation
import Shared
import Board
import CleanArchitecture

class MockTransitionProtocol:Shared.TransitionProtocol {
    func transitionToLoad() { }
    func transitionToHome(project:ProjectManagedProtocol) { }
    func transitionToProjects(board:BoardProjectsProtocol) { }
    func transitionTo(card:CardProtocol, in project:ProjectManagedProtocol) { }
    func transitionTo(column:ColumnProtocol, in project:ProjectManagedProtocol) { }
    func transitionTo(view:ViewProtocol) { }
    func present(view:ViewProtocol) { }
    func pushTo(view:ViewProtocol) { }
    func pop() { }
    func dismiss() { }
}
