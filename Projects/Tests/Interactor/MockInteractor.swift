import Foundation
import Board
@testable import Projects

class MockInteractor:Interactor {
    var onUpdated:(() -> Void)?
    var onAddProject:(() -> Void)?
    var onDelete:(() -> Void)?
    var onOpenProject:(() -> Void)?
    
    override func updated(project:ProjectProtocol) {
        self.onUpdated?()
    }
    
    override func add(project:ProjectProtocol) {
        self.onAddProject?()
    }
    
    override func delete(project:ProjectProtocol) {
        self.onDelete?()
    }
    
    override func openProjectWith(identifier:String) {
        self.onOpenProject?()
    }
}
