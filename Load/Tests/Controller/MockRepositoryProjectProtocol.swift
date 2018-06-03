import Foundation
import Board
import Shared

class MockRepositoryProjectProtocol:RepositoryProjectProtocol {
    static var onSave:(() -> Void)?
    static var onDelete:(() -> Void)?
    
    required init() { }
    
    func save(project:ProjectProtocol) {
        MockRepositoryProjectProtocol.onSave?()
    }
    
    func delete(project:ProjectProtocol) {
        MockRepositoryProjectProtocol.onDelete?()
    }
}
