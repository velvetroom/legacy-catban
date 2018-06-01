import Foundation
import Shared
import Board

public class Repository:RepositoryProtocol {
    var file:RepositoryFile
    
    public required init() {
        self.file = RepositoryFile()
    }
    
    public func loadBoard() throws -> BoardProtocol {
        try self.file.buildStructure()
        throw ErrorRepository.boardNotFound
    }
    
    public func save(board:BoardProtocol) throws {
        throw ErrorRepository.boardNotFound
    }
    
    public func save(project:ProjectProtocol) throws {
        throw ErrorRepository.boardNotFound
    }
    
    public func delete(project:ProjectProtocol) throws {
        throw ErrorRepository.boardNotFound
    }
}
