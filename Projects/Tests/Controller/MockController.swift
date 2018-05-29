import Foundation
@testable import Projects

class MockController:Controller {
    var onOpenProject:(() -> Void)?
    
    override func openProjectWith(identifier:String) {
        self.onOpenProject?()
    }
}
