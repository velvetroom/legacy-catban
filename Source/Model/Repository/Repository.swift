import Foundation

class Repository:RepositoryProtocol {
    var local:RepositoryLocalProtocol
    
    init() {
        self.local = RepositoryLocal()
    }
    
    func loadBoardFromLocal() throws -> BoardProtocol {
        return try self.local.loadBoard()
    }
    
    func localSave(board:BoardProtocol) throws {
        try self.local.save(board:board)
    }
}
