import UIKit
@testable import Main
@testable import Shared
@testable import Board

class MockNavigationProtocol:NavigationProtocol {
    var onLaunch:(() -> Void)?
    var onTransitionToLoad:(() -> Void)?
    var onTransitionToHome:((ProjectManagedProtocol) -> Void)?
    var onTransitionToCard:((CardProtocol, ProjectManagedProtocol) -> Void)?
    var onNavigateToController:((ControllerProtocol) -> Void)?
    
    required init() { }
    
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
    
    func transitionTo(column:ColumnProtocol, in project:ProjectManagedProtocol) { }
}
