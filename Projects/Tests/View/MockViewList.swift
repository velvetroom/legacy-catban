import Foundation
@testable import Projects

class MockViewList:ViewList {
    var onUpdateLayout:(() -> Void)?
    
    override func updateLayout() {
        self.onUpdateLayout?()
    }
}
