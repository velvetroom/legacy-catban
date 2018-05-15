import UIKit
@testable import Home

class MockViewCard:ViewCard {
    var onTouchSucceded:((Controller) -> Void)?
    private let retainedLeft:NSLayoutConstraint
    private let retainedTop:NSLayoutConstraint
    
    override init() {
        self.retainedLeft = NSLayoutConstraint()
        self.retainedTop = NSLayoutConstraint()
        super.init()
        self.layoutLeft = self.retainedLeft
        self.layoutTop = self.retainedTop
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func touchSucceded(controller:Controller) {
        self.onTouchSucceded?(controller)
    }
}
