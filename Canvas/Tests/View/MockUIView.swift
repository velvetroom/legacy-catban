import UIKit

class MockUIView:UIView {
    var onBringSubviewToFront:(() -> Void)?
    
    override func bringSubview(toFront view:UIView) {
        self.onBringSubviewToFront?()
    }
}
