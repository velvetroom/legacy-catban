import Foundation

protocol RepositoryProtocol {
    func loadBoardFromLocal() throws -> BoardProtocol
    func localSave(board:BoardProtocol) throws
}
