import Foundation
import Board

public protocol RepositoryBoardProtocol {
    init()
    func loadBoard() throws -> BoardProtocol
    func save(board:BoardProtocol)
}
