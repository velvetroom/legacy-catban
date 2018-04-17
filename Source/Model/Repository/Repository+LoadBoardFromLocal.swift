import Foundation

extension Repository {
    func loadBoardFromLocal() throws -> BoardProtocol {
        return try self.local.loadBoard()
    }
}
