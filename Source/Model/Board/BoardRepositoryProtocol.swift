import Foundation

protocol BoardRepositoryProtocol {
    func save(board:BoardProtocol)
    func delete(project:ProjectProtocol)
}
