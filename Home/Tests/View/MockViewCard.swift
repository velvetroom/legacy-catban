import Foundation
@testable import Home

class MockViewCard:ViewCard {
    var onTouchSucceded:((Controller) -> Void)?
    
    override func touchSucceded(controller:Controller) {
        self.onTouchSucceded?(controller)
    }
}
