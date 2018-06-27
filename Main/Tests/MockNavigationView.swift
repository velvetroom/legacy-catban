import UIKit
@testable import Main

class MockNavigationView:NavigationView {
    var onSetViewController:(([UIViewController], Bool) -> Void)?
    var onPush:((UIViewController) -> Void)?
    var onPresent:((UIViewController) -> Void)?
    
    override func setViewControllers(_ viewControllers:[UIViewController], animated:Bool) {
        self.onSetViewController?(viewControllers, animated)
    }
    
    override func pushViewController(_ viewController:UIViewController, animated:Bool) {
        self.onPush?(viewController)
    }
    
    override func present(_ viewControllerToPresent:UIViewController, animated flag:Bool,
                          completion:(() -> Void)? = nil) {
        self.onPresent?(viewControllerToPresent)
    }
}
