import Foundation
@testable import catban

class MockRepositoryLocalProtocol:RepositoryLocalProtocol {
    var onLoadBoard:(() -> Void)?
    var onDeleteProject:((ProjectProtocol) -> Void)?
    var onSaveBoard:((BoardProtocol) -> Void)?
    var onSaveProject:((ProjectProtocol) -> Void)?
    var onSaveUser:((UserProtocol) -> Void)?
    
    func loadBoard() throws -> BoardProtocol {
        self.onLoadBoard?()
        return Board()
    }
    
    func save(board:BoardProtocol) throws {
        self.onSaveBoard?(board)
    }
    
    func delete(project:ProjectProtocol) {
        self.onDeleteProject?(project)
    }
    
    func save(project:ProjectProtocol) throws {
        self.onSaveProject?(project)
    }
    
    func save(user:UserProtocol) throws {
        self.onSaveUser?(user)
    }
}
