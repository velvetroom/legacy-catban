import Foundation

extension Board {
    class func factoryNewBoard() -> BoardProtocol {
        let board:Board = Board()
        let user:User = User.factoryNewUser()
        let project:Project = Project.factoryFirstProject()
        board.projects.append(project)
        board.user = user
        user.project = project
        return board
    }
}
