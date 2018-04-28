import Foundation

protocol RepositoryLocalProtocol {
    func loadBoard() throws -> BoardProtocol
    func save(board:BoardProtocol) throws
    func delete(project:ProjectProtocol) throws
}
