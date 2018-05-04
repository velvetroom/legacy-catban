import UIKit
@testable import Main
@testable import Shared

class MockNavigationProtocol:NavigationProtocol {
    var onLaunch:(() -> Void)?
    var onNavigateToController:((ControllerProtocol) -> Void)?
    
    required init() { }
    
    func launch() -> UIWindow {
        self.onLaunch?()
        return UIApplication.shared.keyWindow!
    }
    
    func navigateTo(controller:ControllerProtocol) {
        self.onNavigateToController?(controller)
    }
}
