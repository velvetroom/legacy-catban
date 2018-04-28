import Foundation

protocol RepositoryProtocol {
    func loadBoard() throws -> BoardProtocol
    func delete(project:ProjectProtocol) throws
    func save(board:BoardProtocol) throws
    func save(project:ProjectProtocol) throws
}
