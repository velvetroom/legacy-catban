import Foundation
import CleanArchitecture
import Board
import Architecture

class MockTransitionProtocol:TransitionProtocol {
    var onTransitionToCard:(() -> Void)?
    var onTransitionToColumn:(() -> Void)?
    var onTransitionToProjects:(() -> Void)?
    var onPush:(() -> Void)?
    var onPresent:(() -> Void)?
    var onDimiss:(() -> Void)?
    
    func transitionToLoad() { }
    func transitionToHome(project:ProjectManagedProtocol) { }
    func pop() { }
    
    func transitionToProjects(board:BoardProjectsProtocol) {
        self.onTransitionToProjects?()
    }
    
    func transitionTo(column:ColumnProtocol, in project:ProjectManagedProtocol) {
        self.onTransitionToColumn?()
    }
    
    func transitionTo(card:CardProtocol, in project:ProjectManagedProtocol) {
        self.onTransitionToCard?()
    }
    
    func pushTo(view:ViewProtocol) {
        self.onPush?()
    }
    
    func present(view:ViewProtocol) {
        self.onPresent?()
    }
    
    func dismiss() {
        self.onDimiss?()
    }
}
