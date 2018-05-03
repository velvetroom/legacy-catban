import Foundation

extension RepositoryLocal {
    func loadBoard() throws -> BoardProtocol {
        let user:UserProtocol = try self.loadUser()
        let projects:[ProjectProtocol] = try self.loadProjects()
        let board:BoardProtocol = try self.buildBoardWith(projects:projects, for:user)
        return board
    }
    
    func loadUser() throws -> UserProtocol {
        let rawUser:Data = try self.file.loadUser()
        let user:UserProtocol = try self.deserialiser.deserialise(user:rawUser)
        return user
    }
    
    func loadProjects() throws -> [ProjectProtocol] {
        let rawProjects:[Data] = try self.file.loadProjects()
        var projects:[ProjectProtocol] = []
        for rawProject:Data in rawProjects {
            let project:ProjectProtocol = try self.deserialiser.deserialise(project:rawProject)
            projects.append(project)
        }
        return projects
    }
    
    func buildBoardWith(projects:[ProjectProtocol], for user:UserProtocol) throws -> BoardProtocol {
        let board:Board = Board()
        board.projects = projects
        board.user = user
        board.user.project = try self.findProjectFor(user:user, in:projects)
        return board
    }
    
    func findProjectFor(user:UserProtocol, in projects:[ProjectProtocol]) throws -> ProjectProtocol {
        for project:ProjectProtocol in projects {
            if project.identifier == user.project.identifier {
                return project
            }
        }
        throw ErrorRepository.unableToFindCurrentProject
    }
}
