import Foundation
@testable import Projects

class MockPresenter:Presenter {
    var onOpen:(() -> Void)?
    var onAddProject:(() -> Void)?
    var onRename:(() -> Void)?
    var onDelete:(() -> Void)?
    
    /*
    override func openProject() {
        self.onOpen?()
    }
    
    override func addProject() {
        self.onAddProject?()
    }
    */
    override func rename() {
        self.onRename?()
    }
    
    override func delete() {
        self.onDelete?()
    }
}
