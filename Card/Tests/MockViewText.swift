import Foundation
@testable import Card

class MockViewText:ViewText {
    var onBecomeFirstResponder:(() -> Void)?
    var onResignsFirstResponder:(() -> Void)?
    
    override func becomeFirstResponder() -> Bool {
        self.onBecomeFirstResponder?()
        return true
    }
    
    override func resignFirstResponder() -> Bool {
        self.onResignsFirstResponder?()
        return true
    }
}
