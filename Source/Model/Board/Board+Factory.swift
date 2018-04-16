import Foundation

extension Board {
    class func factoryNewBoard() -> BoardProtocol {
        let board:Board = Board()
        let project:ProjectProtocol = Project.factoryFirstProject()
        board.projects.append(project)
        return board
    }
}
