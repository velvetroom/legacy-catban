import Foundation
@testable import Projects

class MockView:View {
    var onShowNavigationBar:(() -> Void)?
    
    override func showNavigationBar() {
        self.onShowNavigationBar?()
    }
}
