import Foundation
import CleanArchitecture
import Architecture
import Board

class MockTransitionProtocol:TransitionProtocol {
    var onTransitionToHome:(() -> Void)?
    var onPresent:(() -> Void)?
    var onPush:((ViewProtocol) -> Void)?
    
    func transitionToLoad() { }
    func transitionTo(card:CardProtocol, in project:ProjectManagedProtocol) { }
    func transitionTo(column:ColumnProtocol, in project:ProjectManagedProtocol) { }
    func transitionToProjects(board:ProjectManagerProtocol) { }
    func pop() { }
    func dismiss() { }
    
    func pushTo(view:ViewProtocol) {
        self.onPush?(view)
    }
    
    func transitionToHome(project:ProjectManagedProtocol) {
        self.onTransitionToHome?()
    }
    
    func present(view:ViewProtocol) {
        self.onPresent?()
    }
}
