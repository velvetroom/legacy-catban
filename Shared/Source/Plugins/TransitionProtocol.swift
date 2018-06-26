import Foundation
import Board
import CleanArchitecture

public protocol TransitionProtocol:CleanArchitecture.TransitionProtocol {
    func transitionToLoad()
    func transitionToHome(project:ProjectManagedProtocol)
    func transitionToProjects(board:BoardProjectsProtocol)
    func transitionTo(card:CardProtocol, in project:ProjectManagedProtocol)
    func transitionTo(column:ColumnProtocol, in project:ProjectManagedProtocol)
}
