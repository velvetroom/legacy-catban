import Foundation
@testable import Projects

class MockController:Controller {
    var onOpenProject:(() -> Void)?
    var onDelete:(() -> Void)?
    
    override func openProjectWith(identifier:String) {
        self.onOpenProject?()
    }
    
    override func deleteProjectWith(identifier:String) {
        self.onDelete?()
    }
}
