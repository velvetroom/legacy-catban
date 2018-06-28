import Foundation
import CleanArchitecture
import Architecture
import Board

class MockTransitionProtocol:TransitionProtocol {
    var onTransitionToHome:((ProjectProtocol) -> Void)?
    var onTransitionToProjects:(() -> Void)?
    
    func transitionToProjects(board:BoardProtocol) {
        self.onTransitionToProjects?()
    }
    
    func transitionToHome(board:BoardProtocol, project:ProjectProtocol) {
        self.onTransitionToHome?(project)
    }
}
