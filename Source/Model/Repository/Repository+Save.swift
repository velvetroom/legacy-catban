import Foundation

extension Repository {
    func save(board:BoardProtocol) throws {
        try self.local.save(board:board)
    }
    
    func save(project:ProjectProtocol) throws {
        try self.local.save(project:project)
    }
}
