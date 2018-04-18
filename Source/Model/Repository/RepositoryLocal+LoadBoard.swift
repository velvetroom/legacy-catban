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
        throw ErrorRepository.boardNotFoundLocally
    }
    
    func loadProjects() throws -> [ProjectProtocol] {
        let rawProjects:[Data] = try self.file.loadProjects()
        throw ErrorRepository.boardNotFoundLocally
    }
    
    func buildBoardWith(projects:[ProjectProtocol], for user:UserProtocol) throws -> BoardProtocol {
        throw ErrorRepository.boardNotFoundLocally
    }
}
