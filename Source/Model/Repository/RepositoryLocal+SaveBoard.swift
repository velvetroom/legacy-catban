import Foundation

extension RepositoryLocal {
    func save(board:BoardProtocol) throws {
        try self.save(user:board.user)
        try self.save(projects:board.projects)
    }
    
    func save(user:UserProtocol) throws {
        try self.file.save(user:user)
    }
    
    func save(projects:[ProjectProtocol]) throws {
        try self.file.save(projects:projects)
    }
}
