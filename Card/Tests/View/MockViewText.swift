import Foundation
@testable import Card

class MockViewText:ViewText {
    var onBecomeFirstResponder:(() -> Void)?
    
    override func becomeFirstResponder() -> Bool {
        self.onBecomeFirstResponder?()
        return true
    }
}
