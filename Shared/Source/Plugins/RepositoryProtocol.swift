import Foundation
import Board

public protocol RepositoryProtocol {
    func loadBoard() throws -> BoardProtocol
    func save(board:BoardProtocol) throws
    func save(project:ProjectProtocol) throws
    func delete(project:ProjectProtocol) throws
}
