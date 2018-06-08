import Foundation
@testable import Projects

class MockController:Controller {
    var onOpenProject:(() -> Void)?
    var onDelete:(() -> Void)?
    var onRenameProject:(() -> Void)?
    
    override func openProjectWith(identifier:String) {
        self.onOpenProject?()
    }
    
    override func deleteProjectWith(identifier:String) {
        self.onDelete?()
    }
    
    override func renameProjectWith(identifier:String) {
        self.onRenameProject?()
    }
}
