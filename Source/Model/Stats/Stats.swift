import Foundation

class Stats:StatsProtocol {
    var board:BoardProtocol
    
    required init() {
        self.board = Board()
    }
}
