import Foundation
@testable import Column

class MockView:View {
    var onShowNavigationBar:(() -> Void)?
    
    override func showNavigationBar() {
        self.onShowNavigationBar?()
    }
}
