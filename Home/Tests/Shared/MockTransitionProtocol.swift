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
    
    func transitionToProjects(board:BoardProtocol) {
        self.onTransitionToProjects?()
    }
    
    func transitionTo(column:ColumnProtocol, board:BoardProtocol, project:ProjectProtocol) {
        self.onTransitionToColumn?()
    }
    
    func transitionTo(card:CardProtocol, board:BoardProtocol, project:ProjectProtocol) {
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
