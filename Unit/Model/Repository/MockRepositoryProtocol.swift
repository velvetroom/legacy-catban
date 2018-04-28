import Foundation
@testable import catban

class MockRepositoryProtocol:RepositoryProtocol {
    var onLoadBoardFromLocal:(() -> Void)?
    var onLocalSave:((BoardProtocol) -> Void)?
    var onLocalDeleteProject:((ProjectProtocol) -> Void)?
    
    func loadBoardFromLocal() throws -> BoardProtocol {
        self.onLoadBoardFromLocal?()
        return Board()
    }
    
    func localSave(board:BoardProtocol) throws {
        self.onLocalSave?(board)
    }
    
    func localDelete(project:ProjectProtocol) throws {
        self.onLocalDeleteProject?(project)
    }
}
