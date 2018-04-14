import Foundation

class Board:BoardProtocol {
    var projects:[ProjectProtocol]
    
    init() {
        self.projects = []
    }
}
