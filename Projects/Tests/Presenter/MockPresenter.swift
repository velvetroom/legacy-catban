import Foundation
@testable import Projects

class MockPresenter:Presenter {
    var onOpen:(() -> Void)?
    var onAddProject:(() -> Void)?
    var onRename:(() -> Void)?
    var onDelete:(() -> Void)?
    var onShouldUpdate:(() -> Void)?
    
    override func shouldUpdate() {
        self.onShouldUpdate?()
    }
    
    override func openProject() {
        self.onOpen?()
    }
    
    override func addProject() {
        self.onAddProject?()
    }
    
    override func renameProject() {
        self.onRename?()
    }
    
    override func delete() {
        self.onDelete?()
    }
}
