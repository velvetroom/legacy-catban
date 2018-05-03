import UIKit

class NavigationFactory {
    class func newWindow() -> UIWindow {
        let window:UIWindow = UIWindow(frame:UIScreen.main.bounds)
        window.backgroundColor = UIColor.white
        window.makeKeyAndVisible()
        return window
    }
    
    class func newView() -> UINavigationController {
        let view:UINavigationController = UINavigationController(nibName:nil, bundle:nil)
        return view
    }
}
