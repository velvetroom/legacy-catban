import UIKit
@testable import Main

class MockNavigationProtocol:NavigationProtocol {
    var onLaunch:(() -> Void)?
    var window:UIWindow?
    
    func launch() {
        self.onLaunch?()
    }
}
