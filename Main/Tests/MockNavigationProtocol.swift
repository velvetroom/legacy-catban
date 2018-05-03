import UIKit
@testable import Main

class MockNavigationProtocol:NavigationProtocol {
    var onLaunch:(() -> Void)?
    
    func launch() -> UIWindow {
        self.onLaunch?()
        return UIApplication.shared.keyWindow!
    }
}
