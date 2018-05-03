import UIKit

class Navigation:NavigationProtocol {
    var view:UINavigationController!
    
    func launch() -> UIWindow {
        let window:UIWindow = NavigationFactory.newWindow()
        self.view = NavigationFactory.newView()
        window.rootViewController = self.view
        return window
    }
}
