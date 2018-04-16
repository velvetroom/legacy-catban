import UIKit

class MockNavigationController:UINavigationController {
    var onPresent:((UIViewController) -> Void)?
    var onDismiss:(() -> Void)?
    var onSetControllers:(([UIViewController]) -> Void)?
    
    init() {
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
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
