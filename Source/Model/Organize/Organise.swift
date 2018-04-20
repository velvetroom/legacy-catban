import Foundation

class Organise:OrganiseProtocol {
    var board:BoardProtocol
    
    init() {
        self.board = Board()
    }
}
