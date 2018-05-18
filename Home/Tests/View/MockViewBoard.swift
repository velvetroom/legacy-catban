import Foundation
@testable import Home

class MockViewBoard:ViewBoard {
    var onRemoveSubviews:(() -> Void)?
    
    override func removeSubviews() {
        self.onRemoveSubviews?()
    }
}
