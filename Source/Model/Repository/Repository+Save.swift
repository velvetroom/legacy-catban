import Foundation

extension Repository {
    func localSave(board:BoardProtocol) throws {
        try self.local.save(board:board)
    }
}
