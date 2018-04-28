import Foundation

protocol RepositoryLocalProtocol {
    func loadBoard() throws -> BoardProtocol
    func delete(project:ProjectProtocol) throws
    func save(board:BoardProtocol) throws
    func save(project:ProjectProtocol) throws
}
