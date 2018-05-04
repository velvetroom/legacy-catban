import UIKit
@testable import Main
@testable import Shared

class MockNavigationProtocol:NavigationProtocol {
    var onLaunch:(() -> Void)?
    var onTransitionToLoad:(() -> Void)?
    var onTransitionToHome:(() -> Void)?
    var onNavigateToController:((ControllerProtocol) -> Void)?
    
    required init() { }
    
    func launch() -> UIWindow {
        self.onLaunch?()
        return UIApplication.shared.keyWindow!
    }
    
    func transitionToLoad() {
        self.onTransitionToLoad?()
    }
    
    func transitionToHome() {
        self.onTransitionToHome?()
    }
}
