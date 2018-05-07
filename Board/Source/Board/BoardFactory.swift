import Foundation

public class BoardFactory {
    public class func newKanbanBoard() -> BoardProtocol {
        let kanban:ProjectProtocol = ProjectFactory.newKanbanProject()
        let board:BoardProtocol = newBoard()
        board.add(project:kanban)
        return board
    }
    
    public class func newBoard() -> BoardProtocol {
        var board:BoardProtocol = blankBoard()
        board.identifier = UUID().uuidString
        return board
    }
    
    public class func blankBoard() -> BoardProtocol {
        return Board()
    }
}
