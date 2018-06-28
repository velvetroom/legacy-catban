import Foundation
import CleanArchitecture
import Board

public protocol TransitionProtocol:class {
    func transitionToLoad()
    func transitionToHome(board:BoardProtocol, project:ProjectProtocol)
    func transitionToProjects(board:BoardProtocol)
    func transitionTo(card:CardProtocol, board:BoardProtocol, project:ProjectProtocol)
    func transitionTo(column:ColumnProtocol, board:BoardProtocol, project:ProjectProtocol)
    func present(view:ViewProtocol)
    func pushTo(view:ViewProtocol)
    func pop()
    func dismiss()
}
