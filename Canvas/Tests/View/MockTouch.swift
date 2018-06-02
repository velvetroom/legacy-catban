import UIKit

class MockTouch:UITouch {
    var returnView:UIView?
    
    override var view:UIView? {
        get {
            return self.returnView
        }
    }
}
