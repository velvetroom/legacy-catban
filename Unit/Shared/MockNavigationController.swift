import UIKit
@testable import catban

class MockNavigationController:ApplicationNavigationController {
    var onPresent:((UIViewController) -> Void)?
    var onDismiss:(() -> Void)?
    var onSetControllers:(([UIViewController]) -> Void)?
    
    override func present(_ viewControllerToPresent:UIViewController,
                          animated flag:Bool, completion:(() -> Void)? = nil) {
        self.onPresent?(viewControllerToPresent)
    }
    
    override func dismiss(animated flag:Bool, completion:(() -> Void)? = nil) {
        self.onDismiss?()
    }
    
    override func setViewControllers(_ viewControllers:[UIViewController], animated:Bool) {
        self.onSetControllers?(viewControllers)
    }
}
