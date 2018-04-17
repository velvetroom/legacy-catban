import Foundation

class Board:BoardProtocol {
    var user:UserProtocol
    var projects:[ProjectProtocol]
    var project:ProjectProtocol {
        get {
            return self.user.project
        }
    }
    
    init() {
        self.user = User()
        self.projects = []
    }
}
