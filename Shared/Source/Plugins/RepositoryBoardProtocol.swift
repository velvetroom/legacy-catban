import Foundation
import Board

public protocol RepositoryBoardProtocol {
    func loadBoard() throws -> BoardProtocol
    func save(board:BoardProtocol) throws
}
