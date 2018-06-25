import UIKit
@testable import Main

class MockNavigationView:NavigationView {
    var onSetViewController:(([UIViewController], Bool) -> Void)?
    
    override func setViewControllers(_ viewControllers:[UIViewController], animated:Bool) {
        self.onSetViewController?(viewControllers, animated)
    }
}
