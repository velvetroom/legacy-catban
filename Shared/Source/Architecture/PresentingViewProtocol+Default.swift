import UIKit

public extension PresentingViewProtocol {
    var viewController:UIViewController {
        get {
            return self as! UIViewController
        }
    }
}
