import UIKit

class MockNavigationController:UINavigationController {
    var onPresent:((UIViewController) -> Void)?
    var onDismiss:(() -> Void)?
    
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
}
