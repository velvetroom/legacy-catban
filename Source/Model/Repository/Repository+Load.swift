import Foundation

extension Repository {
    func loadBoard() throws -> BoardProtocol {
        return try self.local.loadBoard()
    }
}
