import UIKit
import CleanArchitecture
import Board
@testable import Main

class MockNavigationProtocol:NavigationProtocol {
    var onLaunch:(() -> Void)?
    var onTransitionToLoad:(() -> Void)?
    var onTransitionToHome:((ProjectProtocol) -> Void)?
    var onTransitionToCard:((CardProtocol, ProjectProtocol) -> Void)?
    var onTransitionToColumn:(() -> Void)?
    
    required init() { }
    
    func transitionToProjects(board:BoardProtocol) { }
    func present(view:ViewProtocol) { }
    func pushTo(view:ViewProtocol) { }
    func pop() { }
    func dismiss() { }
    
    func launch() -> UIWindow {
        self.onLaunch?()
        return UIApplication.shared.keyWindow!
    }
    
    func transitionToLoad() {
        self.onTransitionToLoad?()
    }
    
    func transitionToHome(board:BoardProtocol, project:ProjectProtocol) {
        self.onTransitionToHome?(project)
    }
    
    func transitionTo(card:CardProtocol, board:BoardProtocol, project:ProjectProtocol) {
        self.onTransitionToCard?(card, project)
    }
    
    func transitionTo(column:ColumnProtocol, board:BoardProtocol, project:ProjectProtocol) {
        self.onTransitionToColumn?()
    }
}
