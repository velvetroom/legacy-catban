import Foundation

extension RepositoryLocal {
    func save(board:BoardProtocol) throws {
        try self.save(user:board.user)
        try self.save(projects:board.projects)
    }
    
    func save(user:UserProtocol) throws {
        let data:Data = try self.serialiser.serialise(user:user)
        try self.file.save(user:data)
    }
    
    func save(projects:[ProjectProtocol]) throws {
        for project:ProjectProtocol in projects {
            try self.save(project:project)
        }
    }
    
    private func save(project:ProjectProtocol) throws {
        let data:Data = try self.serialiser.serialise(project:project)
        try self.file.save(project:data, with:project.identifier)
    }
}
