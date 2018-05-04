import Foundation

public class BoardFactory {
    public class func newBoard() -> BoardProtocol {
        var board:BoardProtocol = Board()
        board.identifier = UUID().uuidString
        return board
    }
}
