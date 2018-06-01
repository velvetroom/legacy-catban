import Foundation
import Shared
import Board

public class Repository:RepositoryProtocol {
    var file:RepositoryFile
    var deserialise:DeserialiseProtocol
    
    public required init() {
        self.file = RepositoryFile()
        self.deserialise = Deserialise()
    }
    
    public func loadBoard() throws -> BoardProtocol {
        try self.file.buildStructure()
        self.deserialise.data = try self.file.boardData()
        let board:BoardProtocol = try self.deserialise.makeBoard()
        try self.loadProjectsOn(board:board)
        return board
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
    
    private func loadProjectsOn(board:BoardProtocol) throws {
        
    }
}
