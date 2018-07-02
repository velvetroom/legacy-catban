import Foundation
import Board

public extension RepositoryBoardProtocol {
    func save(board:BoardProtocol) { }
    
    func loadBoard() throws -> BoardProtocol {
        throw NSError(domain:String(), code:0, userInfo:nil)
    }
}
