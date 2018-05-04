import Foundation
import Shared
import Board

public class Repository:RepositoryProtocol {
    public required init() { }
    
    public func loadBoard() throws -> BoardProtocol {
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
