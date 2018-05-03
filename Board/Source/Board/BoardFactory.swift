import Foundation

class BoardFactory {
    class func newBoard() -> BoardProtocol {
        let board:BoardProtocol = Board()
        let project:ProjectProtocol = Project.factoryFirstProject()
        board.insertProject(project:project)
        return board
    }
}
