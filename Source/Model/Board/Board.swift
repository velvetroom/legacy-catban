import Foundation

class Board:BoardProtocol {
    var user:UserProtocol
    var projects:[ProjectProtocol]
    
    init() {
        self.user = User()
        self.projects = []
    }
}
