import Foundation
import Board
import Shared

class MockRepositoryProjectProtocol:RepositoryProjectProtocol {
    static var onSave:(() -> Void)?
    static var onDelete:(() -> Void)?
    
    required init() { }
    
    func localSave(project:ProjectProtocol) {
        MockRepositoryProjectProtocol.onSave?()
    }
    
    func localDelete(project:ProjectProtocol) {
        MockRepositoryProjectProtocol.onDelete?()
    }
}
