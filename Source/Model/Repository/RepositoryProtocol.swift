import Foundation

protocol RepositoryProtocol {
    func loadBoard() throws -> BoardProtocol
}
