import UIKit

class MockNavigationController:UINavigationController {
    var onSetViewController:(([UIViewController], Bool) -> Void)?
    
    override func setViewControllers(_ viewControllers:[UIViewController], animated:Bool) {
        self.onSetViewController?(viewControllers, animated)
    }
}
