import Foundation
@testable import catban

class MockRepositoryProtocol:RepositoryProtocol {
    var onLoadBoard:(() -> Void)?
    var onDeleteProject:((ProjectProtocol) -> Void)?
    var onSaveBoard:((BoardProtocol) -> Void)?
    var onSaveProject:((ProjectProtocol) -> Void)?
    var onSaveUser:((UserProtocol) -> Void)?
    
    func loadBoard() throws -> BoardProtocol {
        self.onLoadBoard?()
        return Board()
    }
    
    func delete(project:ProjectProtocol) throws {
        self.onDeleteProject?(project)
    }
    
    func save(board:BoardProtocol) throws {
        self.onSaveBoard?(board)
    }
    
    func save(project:ProjectProtocol) throws {
        self.onSaveProject?(project)
    }
    
    func save(user:UserProtocol) throws {
        self.onSaveUser?(user)
    }
}
