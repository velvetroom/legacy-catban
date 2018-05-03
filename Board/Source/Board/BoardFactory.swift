import Foundation

class BoardFactory {
    class func newBoard() -> BoardProtocol {
        var board:BoardProtocol = Board()
        board.identifier = UUID().uuidString
        return board
    }
}
