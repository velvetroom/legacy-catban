import Foundation
import CleanArchitecture
import Board

public protocol TransitionProtocol:class {
    func transitionToLoad()
    func transitionToHome(project:ProjectManagedProtocol)
    func transitionToProjects(board:BoardProjectsProtocol)
    func transitionTo(card:CardProtocol, in project:ProjectManagedProtocol)
    func transitionTo(column:ColumnProtocol, in project:ProjectManagedProtocol)
    func present(view:ViewProtocol)
    func pushTo(view:ViewProtocol)
    func pop()
    func dismiss()
}