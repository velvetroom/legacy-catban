import Foundation
import CleanArchitecture
import Board

class MockTransitionProtocol:TransitionProtocol {
    var onTransitionToHome:(() -> Void)?
    var onPresent:(() -> Void)?
    var onPush:((ViewProtocol) -> Void)?
    var onPop:(() -> Void)?
    var onDimiss:(() -> Void)?
    
    func transitionToLoad() { }
    func transitionTo(card:CardProtocol, in project:ProjectManagedProtocol) { }
    func transitionTo(column:ColumnProtocol, in project:ProjectManagedProtocol) { }
    func transitionToProjects(board:BoardProjectsProtocol) { }
    
    func pop() {
        self.onPop?()
    }
    
    func pushTo(view:ViewProtocol) {
        self.onPush?(view)
    }
    
    func transitionToHome(project:ProjectManagedProtocol) {
        self.onTransitionToHome?()
    }
    
    func present(view:ViewProtocol) {
        self.onPresent?()
    }
    
    func dismiss() {
        self.onDimiss?()
    }
}
