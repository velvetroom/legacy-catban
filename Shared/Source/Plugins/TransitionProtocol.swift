import Foundation
import Board

public protocol TransitionProtocol:class {
    func transitionToLoad()
    func transitionToHome(project:ProjectManagedProtocol)
    func transitionTo(card:CardProtocol, in project:ProjectManagedProtocol)
    func transitionTo(column:ColumnProtocol, in project:ProjectManagedProtocol)
}
