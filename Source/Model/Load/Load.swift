import Foundation

class Load:LoadProtocol {
    var board:BoardProtocol
    
    init() {
        self.board = Board()
    }
}
