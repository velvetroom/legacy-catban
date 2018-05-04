import UIKit
import Shared

class NavigationFactory {
    class func newNavigation() -> NavigationProtocol {
        return Navigation()
    }
    
    class func newWindow() -> UIWindow {
        let window:UIWindow = UIWindow(frame:UIScreen.main.bounds)
        window.backgroundColor = UIColor.white
        window.makeKeyAndVisible()
        return window
    }
}
