import UIKit
@testable import Main
@testable import Shared
@testable import Board

class MockNavigationProtocol:NavigationProtocol {
    var onLaunch:(() -> Void)?
    var onTransitionToLoad:(() -> Void)?
    var onTransitionToHome:((ProjectManagedProtocol) -> Void)?
    var onTransitionToCard:((CardProtocol, ProjectManagedProtocol) -> Void)?
    
    required init() { }
    
    func transitionTo(column:ColumnProtocol, in project:ProjectManagedProtocol) { }
    func transitionToProjects(board:BoardProjectsProtocol) { }
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
    
    func transitionToHome(project:ProjectManagedProtocol) {
        self.onTransitionToHome?(project)
    }
    
    func transitionTo(card:CardProtocol, in project:ProjectManagedProtocol) {
        self.onTransitionToCard?(card, project)
    }
}
