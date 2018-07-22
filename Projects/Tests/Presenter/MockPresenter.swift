import Foundation
@testable import Projects

class MockPresenter:Presenter {
    var onOpen:(() -> Void)?
    var onAddProject:(() -> Void)?
    var onRename:(() -> Void)?
    var onDelete:(() -> Void)?
    var onShouldUpdate:(() -> Void)?
    var onOpenCloud:(() -> Void)?
    var onOpenScanner:(() -> Void)?
    
    override func openProject() {
        self.onOpen?()
    }
    
    override func openProjectCloud() {
        self.onOpenCloud?()
    }
    
    override func addProject() {
        self.onAddProject?()
    }
 
    override func rename() {
        self.onRename?()
    }
    
    override func delete() {
        self.onDelete?()
    }
    
    override func shouldUpdate() {
        self.onShouldUpdate?()
    }
    
    override func openScanner() {
        self.onOpenScanner?()
    }
}
