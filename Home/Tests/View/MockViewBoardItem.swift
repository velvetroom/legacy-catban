import Foundation
@testable import Home

class MockViewBoardItem:ViewBoardItem {
    var onShowOn:(() -> Void)?
    var onShowOff:(() -> Void)?
    
    override func showOn() {
        self.onShowOn?()
    }
    
    override func showOff() {
        self.onShowOff?()
    }
}
