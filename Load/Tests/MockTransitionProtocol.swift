import Foundation
import CleanArchitecture
import Architecture
import Board

class MockTransitionProtocol:TransitionProtocol {
    var onTransitionToHome:((ProjectProtocol) -> Void)?
    var onTransitionToProjects:(() -> Void)?
    
    func transitionToLoad() { }
    func pushTo(view:ViewProtocol) { }
    func pop() { }
    func present(view:ViewProtocol) { }
    func dismiss() { }
    func transitionTo(card:CardProtocol, board:BoardProtocol, project:ProjectProtocol) { }
    func transitionTo(column:ColumnProtocol, board:BoardProtocol, project:ProjectProtocol) { }
    
    func transitionToProjects(board:BoardProtocol) {
        self.onTransitionToProjects?()
    }
    
    func transitionToHome(board:BoardProtocol, project:ProjectProtocol) {
        self.onTransitionToHome?(project)
    }
}
