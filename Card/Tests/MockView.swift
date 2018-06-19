import UIKit
@testable import Card

class MockView:View {
    var onPresentController:(() -> Void)?
    
    override func present(_:UIViewController, animated flag:Bool, completion:(() -> Void)? = nil) {
        self.onPresentController?()
    }
}
