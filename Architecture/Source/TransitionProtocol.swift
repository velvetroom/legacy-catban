import Foundation
import CleanArchitecture
import Board

public protocol TransitionProtocol:class {
    func transitionToLoad()
    func transitionToHome(board:BoardProtocol, project:ProjectProtocol)
    func transitionToProjects(board:BoardProtocol)
    func transitionTo(card:CardProtocol, board:BoardProtocol, project:ProjectProtocol)
    func transitionTo(column:ColumnProtocol, board:BoardProtocol, project:ProjectProtocol)
    func transitionToCloud(board:BoardProtocol, project:ProjectProtocol)
    func present(view:ViewProtocol)
    func presentAnimated(view:ViewProtocol, completion:(() -> Void)?)
    func pushTo(view:ViewProtocol)
    func pop()
    func dismiss()
    func dismissAnimated(completion:(() -> Void)?)
}
